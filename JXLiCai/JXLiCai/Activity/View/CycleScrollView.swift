//
//  CycleScrollView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/3.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

@objc protocol CycleScrollViewDelegate{
    /// 点击图片回调
    @objc optional func cycleScrollViewDidSelect(at index:Int, cycleScrollView:CycleScrollView)
    /// 图片滚动回调
    @objc optional func cycleScrollViewDidScroll(to index:Int, cycleScrollView:CycleScrollView)
}

class CycleScrollView: UIView,PageControlAlimentProtocol,EndlessScrollProtocol {

   //对外提供的属性
    weak var delegate:CycleScrollViewDelegate?
    
    //数据
    var imagesType:ImageType = .SERVICE
    var localImgArray :[String]? {
        didSet {
            if let local = localImgArray {
                proxy = Proxy(type: .LOCAL, array: local)
                reloadData()
            }
        }
    }
    var serverImgArray:[String]? {
        didSet {
            if let server = serverImgArray {
                proxy = Proxy(type: .SERVICE, array: server)
                reloadData()
            }
        }
    }
    var descTextArray :[String]?
    
    //CycleCell相关
    var imageContentModel: UIViewContentMode?
    var descLabelFont: UIFont?
    var descLabelTextColor: UIColor?
    var descLabelHeight: CGFloat?
    var descLabelTextAlignment:NSTextAlignment?
    var bottomViewBackgroundColor: UIColor?
    
    
    //主要功能需求相关
    override var frame: CGRect {
        didSet {
            flowLayout?.itemSize = frame.size
            collectionView?.frame = bounds
        }
    }
    var isAutoScroll:Bool = true {
        didSet {
            timer?.invalidate()
            timer = nil
            if isAutoScroll == true {
                setupTimer()
            }
        }
    }
    var isEndlessScroll:Bool = true {
        didSet {
            reloadData()
        }
    }
    var autoScrollInterval: Double = 1.5
    
    // pageControl相关
    var pageControlAliment: PageControlAliment = .CenterBottom
    var pageControlPointSpace: CGFloat = 15
    var showPageControl: Bool = true {
        didSet {
            setupPageControl()
        }
    }
    var currentDotColor: UIColor = UIColor.orange {
        didSet {
            self.pageControl?.currentPageIndicatorTintColor = currentDotColor
        }
    }
    var otherDotColor: UIColor = UIColor.gray {
        didSet {
            self.pageControl?.pageIndicatorTintColor = otherDotColor
        }
    }
    
    // MARK: 对外提供的方法
    func reloadData()
    {
        timer?.invalidate()
        timer = nil
        collectionView?.reloadData()
        
        setupPageControl()
        if canChangeCycleCell == true {
            changeToFirstCycleCell(animated: false, collectionView: collectionView!)
        }
        if isAutoScroll == true {
            setupTimer()
        }
        guard let pageControl = self.pageControl else {
            return
        }
        
        if showPageControl == true {
            self.relayoutPageControl(pageControl: pageControl)
        }
    }

    // MARK: 内部属性
    let endlessScrollTimes:Int = 128
    fileprivate var imgsCount:Int {
        return (isEndlessScroll == true) ? (itemsInSection / endlessScrollTimes) : itemsInSection
    }
    var itemsInSection:Int {
        guard let imgs = proxy?.imageArray else {
            return 0
        }
        return (isEndlessScroll == true) ? (imgs.count * endlessScrollTimes) : imgs.count
    }
    fileprivate var firstItem:Int {
        return (isEndlessScroll == true) ? (itemsInSection / 2) : 0
    }
    fileprivate var canChangeCycleCell:Bool {
        guard itemsInSection  != 0 ,
            let _ = collectionView,
            let _ = flowLayout else {
                return false
        }
        return true
    }
    fileprivate var indexOnPageControl:Int {
        var curIndex = Int((collectionView!.contentOffset.x + flowLayout!.itemSize.width * 0.5) / flowLayout!.itemSize.width)
        curIndex = max(0, curIndex)
        return curIndex % imgsCount
    }
    fileprivate var proxy:Proxy!
    fileprivate var flowLayout:UICollectionViewFlowLayout?
    fileprivate var collectionView:UICollectionView?
    fileprivate let CellID = "CycleCell"
    fileprivate var pageControl:UIPageControl?
    var timer:Timer?
    // 标识子控件是否布局完成，布局完成后在layoutSubviews方法中就不执行 changeToFirstCycleCell 方法
    fileprivate var isLoadOver = false

    // MARK: 构造方法
    /// 构造方法
    ///
    /// - Parameters:
    ///   - frame: frame
    ///   - type:  ImagesType                         default:Server
    ///   - imgs:  localImgArray / serverImgArray     default:nil
    ///   - descs: descTextArray                      default:nil
    init(frame: CGRect, type:ImageType = .SERVICE, imgs:[String]? = nil, descs:[String]? = nil)
    {
        super.init(frame: frame)
        setupCollectionView()
        imagesType = type
        if imagesType == .SERVICE {
            if let server = imgs {
                proxy = Proxy(type: .SERVICE, array: server)
            }
        }
        else {
            if let local = imgs {
                proxy = Proxy(type: .LOCAL, array: local)
            }
        }
        
        if let descTexts = descs {
            descTextArray = descTexts
        }
        reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 支持StoryBoard创建
        super.init(coder: aDecoder)
        self.setupCollectionView()
    }
    
    deinit {
        collectionView?.delegate = nil
        print("WRCycleScrollView  deinit")
    }
    
    
    // MARK: 内部方法（layoutSubviews、willMove）
    override func layoutSubviews()
    {
        super.layoutSubviews()
        // 解决CycleCell自动偏移问题
        collectionView?.contentInset = .zero
        if isLoadOver == false && canChangeCycleCell == true {
            changeToFirstCycleCell(animated: false, collectionView: collectionView!)
        }
        
        guard let pageControl = self.pageControl else {
            return
        }
        
        if showPageControl == true {
            self.relayoutPageControl(pageControl: pageControl)
        }
    }
    
    override func willMove(toSuperview newSuperview: UIView?)
    {   // 解决定时器导致的循环引用
        super.willMove(toSuperview: newSuperview)
        // 展现的时候newSuper不为nil，离开的时候newSuper为nil
        guard let _ = newSuperview else {
            timer?.invalidate()
            timer = nil
            return
        }
    }

}

// MARK: - 定时器、自动滚动、scrollView代理方法
//=======================================================
extension CycleScrollView
{
    func setupTimer()
    {
        timer = Timer(timeInterval: autoScrollInterval, target: self, selector: #selector(autoChangeCycleCell), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    func autoChangeCycleCell()
    {
        if canChangeCycleCell == true {
            changeCycleCell(collectionView: collectionView!)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.invalidate()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        if isAutoScroll == true {
            setupTimer()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    {
        guard canChangeCycleCell else {
            return
        }
        delegate?.cycleScrollViewDidScroll?(to: indexOnPageControl, cycleScrollView: self)
        
        if indexOnPageControl >= firstItem {
            isLoadOver = true
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        guard canChangeCycleCell else {
            return
        }
        pageControl?.currentPage = indexOnPageControl
    }
}

// MARK: - pageControl页面
//=======================================================
extension CycleScrollView
{
    fileprivate func setupPageControl()
    {
        pageControl?.removeFromSuperview()
        if showPageControl == true
        {
            pageControl = UIPageControl()
            pageControl?.numberOfPages = imgsCount
            pageControl?.hidesForSinglePage = true
            pageControl?.currentPageIndicatorTintColor = self.currentDotColor
            pageControl?.pageIndicatorTintColor = self.otherDotColor
            pageControl?.isUserInteractionEnabled = false
            addSubview(pageControl!)
        }
    }
}

// MARK: - CycleCell 相关
//=======================================================
extension CycleScrollView: UICollectionViewDelegate,UICollectionViewDataSource
{
    fileprivate func setupCollectionView()
    {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout?.itemSize = frame.size
        flowLayout?.minimumLineSpacing = 0
        flowLayout?.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout!)
        collectionView?.register(CycleCell.self, forCellWithReuseIdentifier: CellID)
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        addSubview(collectionView!)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return itemsInSection
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let curIndex = indexPath.item % imgsCount
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath) as! CycleCell
        cell.imageSource = proxy[curIndex]
        cell.descText = descTextArray?[curIndex]
        
        if let _ = descTextArray
        {
            cell.imageContentModel = (imageContentModel == nil) ? cell.imageContentModel : imageContentModel!
            cell.descLabelFont = (descLabelFont == nil) ? cell.descLabelFont : descLabelFont!
            cell.descLabelTextColor = (descLabelTextColor == nil) ? cell.descLabelTextColor : descLabelTextColor!
            cell.descLabelHeight = (descLabelHeight == nil) ? cell.descLabelHeight : descLabelHeight!
            cell.descLabelTextAlignment = (descLabelTextAlignment == nil) ? cell.descLabelTextAlignment : descLabelTextAlignment!
            cell.bottomViewBackgroundColor = (bottomViewBackgroundColor == nil) ? cell.bottomViewBackgroundColor : bottomViewBackgroundColor!
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        delegate?.cycleScrollViewDidSelect?(at: indexOnPageControl, cycleScrollView: self)
    }
}



