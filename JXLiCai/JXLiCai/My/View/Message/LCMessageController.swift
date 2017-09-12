//
//  LCMessageController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/6.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCMessageController: XTViewController {

    var tableView = UITableView()
    var dataSource = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息中心";
        self.configUI();
        self.configData();
    }

    
    func configUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style: UITableViewStyle.grouped)
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 44;
        view .addSubview(tableView);
    }
    func configData() {
        
       
        let oneDic = ["title":"京县理财升级通知","from":"系统","context":"各位客户，您好。京县理财将于2017年9月06日20:00进行系统升级。届时将理财业务停业，为各位带来的不便敬请理解！","status":"0","date":"2017-09-05"];
        dataSource .add(oneDic);
        
        let twoDic = ["title":"中秋国庆长假福利|送红包，抽iPhone7","from":"活动","context":"10月1日国庆送礼 1.领88元红包 2.每天完成任务50个抽奖名额，抽iPhone7、100元购物卡、50元话费！","status":"0","date":"2017-10-01"];
        dataSource .add(twoDic);
        
        let threeDic = ["title":"京县理财升级通知","from":"系统","context":"各位客户，您好。京县理财将于2017年8月06日20:00进行系统升级。届时将理财业务停业，为各位带来的不便敬请理解！","status":"1","date":"2017-08-05"]
        dataSource .add(threeDic);
        
        let fourDic = ["title":"嘘，分享就赚，快来捞一笔","from":"活动","context":"各位客户，您好。京县理财将于2017年9月06日20:00进行系统升级。届时将理财业务停业，为各位带来的不便敬请理解！","status":"1","date":"2017-09-06"]
        dataSource .add(fourDic);
        
        let fiveDic = ["title":"京县理财升级通知","from":"系统","context":"各位客户，您好。京县理财将于2017年9月06日20:00进行系统升级。届时将理财业务停业，为各位带来的不便敬请理解！","status":"0","date":"2017-09-06"]
        dataSource .add(fiveDic);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


extension LCMessageController:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 100;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        
        let headerView = LCMessageHeaderView.init(frame: CGRect(x:0,y:0,width:width,height:100))
        headerView.configData(dic:dataSource[section] as! NSDictionary);
        return headerView;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return nil;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let identifier = "messageCell";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil{
            
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        }
        let dic = dataSource[indexPath.section] as! NSDictionary;
        
        cell?.imageView?.image = UIImage .init(named: "clock");
        cell?.textLabel?.text = dic.value(forKey:"date") as? String;
        cell?.textLabel?.textColor = UIColor.lightGray;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true);
        let messageDetailsVC =  LXMessageDetailsController.init();
        messageDetailsVC.dic = dataSource[indexPath.section] as! NSDictionary;
        self.navigationController?.pushViewController(messageDetailsVC, animated: true);
        
    }
    
    
    
    
}
