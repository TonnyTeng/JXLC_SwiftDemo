//
//  LCFinancialController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCFinancialController: XTViewController {

    var scrollView = UIScrollView()
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var oneArray    = NSMutableArray()
    var twoArray    = NSMutableArray()
    var threeArray  = NSMutableArray()
    var fourArray   = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "理财";
        
        self.configUI();
        
       
    }

    func configUI(){
    
        self.automaticallyAdjustsScrollViewInsets = false;
        self.hiddenLeftButtonItem();
        
        scrollView = UIScrollView.init(frame: CGRect(x:0,y:segmentControl.frame.maxY + 5,width:width,height:height - segmentControl.frame.maxY - 5 - 49));
        scrollView.contentSize = CGSize(width:width * CGFloat(self.segmentControl.numberOfSegments),height:height - segmentControl.frame.maxY - 5 - 49);
        scrollView.isPagingEnabled = true;
        scrollView.delegate = self;
        view .addSubview(scrollView);
        
        
        for index in 0..<self.segmentControl.numberOfSegments{
        
            let rect = CGRect(x:(CGFloat)(index) * width, y:0, width:width, height:scrollView.frame.height);
            if index == 3 {
                
                let fullView = LCMoneyFullView.init(frame: rect);
                self.scrollView .addSubview(fullView);
                
            }else{
            
                let tableView = self.getTableView(rect: rect, tag: index + 100);
                self.scrollView .addSubview(tableView);
            }
        }
    }
    
    func getTableView(rect:CGRect,tag:Int)-> UITableView{
    
        
        let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
        tableView.tag = tag;
        tableView.register(UINib(nibName: "FincialCell", bundle: Bundle.main), forCellReuseIdentifier: "FincialCell");
        tableView.dataSource = self;
        tableView.delegate = self;
        
        return tableView;
    }
    
    @IBAction func changeFinancialType(_ sender: UISegmentedControl) {
        
        let point = CGPoint(x:CGFloat(sender.selectedSegmentIndex) * width,y:0);
        self.scrollView .setContentOffset(point, animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LCFinancialController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
//        switch tableView.tag {
//        case 100:
//        {
//            //FincialCell
//            
//            }
//            break;
//        case 101:
//        {
//            //FincialCell
//            
//            }
//            break;
//        case 102:
//        {
//            //FincialCell
//            
//            }
//            break;
//        case 103:
//        {
//            //FincialCell
//            
//            }
//        break;
//        default:
//            
//            
//        }
        
        return 6;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:10))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        return headerView;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:0.1))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "FincialCell"
        let cell = tableView.dequeueReusableCell(withIdentifier:cellId, for: indexPath) as? FincialCell;
        cell?.accessoryType = UITableViewCellAccessoryType.none;

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
       
    }
    
    //MARK - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        let offset = scrollView.contentOffset;
        NSLog("偏移量:\(offset)");
        
//        if offset.x > width * CGFloat(self.segmentControl.numberOfSegments - 1) + width / 3{
//            //最大偏移  返回初始状态
//            
//            self.segmentControl.selectedSegmentIndex = 0;
//            self.scrollView.contentOffset = CGPoint(x:0,y:0);
//        }else if offset.x < 0 && -offset.x > width / 3{
//        
//            //最小偏移 返回最大状态
//            self.segmentControl.selectedSegmentIndex = self.segmentControl.numberOfSegments - 1;
//            self.scrollView.contentOffset = CGPoint(x:width * CGFloat(self.segmentControl.numberOfSegments - 1),y:0);
//            
//        }else{
        
            self.segmentControl.selectedSegmentIndex = Int(offset.x / width);
//        }
    }
}
    




/**
 //判断当前设备是否支持距离传感器
 if UIDevice.current.isProximityMonitoringEnabled {
 //            设备支持距离传感器
 NotificationCenter.default.addObserver(self, selector: #selector(changeFinancialType), name: NSNotification.Name.UIDeviceProximityStateDidChange, object: nil)
 
 //xxxxx 就是当靠近物体的时候需要执行的方法
 } else {
 //            不支持距离传感器
 }
 */
