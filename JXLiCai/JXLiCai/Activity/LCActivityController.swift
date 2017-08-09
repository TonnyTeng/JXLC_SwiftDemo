//
//  LCActivityController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

let cycleHeight = 520 * width / 1080.0

class LCActivityController: XTViewController {

    var tableView:UITableView!
    var cycleScrollView:CycleScrollView?
    var dataArray = NSMutableArray()
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        cycleScrollView?.timer?.invalidate()
        cycleScrollView?.timer = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (cycleScrollView != nil) {
            
            cycleScrollView!.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "活动列表";
        self.hiddenLeftButtonItem();
        self .configDataSource();
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64 - 49), style:UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        
    }
    
    func configDataSource() {
        
        dataArray .add("")
        dataArray .add("")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension LCActivityController: CycleScrollViewDelegate,UITableViewDelegate, UITableViewDataSource
{
    /// 点击图片事件
    func cycleScrollViewDidSelect(at index:Int, cycleScrollView:CycleScrollView)
    {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动事件
    func cycleScrollViewDidScroll(to index:Int, cycleScrollView:CycleScrollView)
    {
        print("滚动到了第\(index+1)个图片")
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1;//dataArray.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 195 + width / 3;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      
        return cycleHeight;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:cycleHeight))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        
        
        let frame = CGRect(x: 0, y: 0, width: width, height: cycleHeight)
        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
        
        cycleScrollView = CycleScrollView(frame: frame, type: .SERVICE, imgs: serverImages)
        cycleScrollView?.delegate = self
        headerView.addSubview(cycleScrollView!)
        
        return headerView;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:0.1))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: ActivityListCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as? ActivityListCell
        if cell == nil {
            cell = ActivityListCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }

        cell?.configDataWithModel(model: ["1":"2"])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
        let detailVC = LCActivityDetailController()
        self.navigationController!.pushViewController(detailVC, animated: true)
        NSLog("选择:\(title)")
    }
}




