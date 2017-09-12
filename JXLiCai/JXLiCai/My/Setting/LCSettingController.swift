//
//  LCSettingController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/6.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit


let TAG_USER        = "1"
let TAG_ACCOUNT     = "2"
let TAG_NOTIC       = "3"
let TAG_FEEDBACK    = "4"
let TAG_QUESTION    = "5"
let TAG_VERSION     = "6"

class LCSettingController: XTViewController {

    var tableView = UITableView()
    var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "设置";
        self .configDataSource();
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
    }
    
    func configDataSource() {
        
        let sectionTwo:[NSDictionary] = [[TITLE:"个人设置",IMAGE:"personal settings",TAG:TAG_USER],
                                         [TITLE:"账户管理",IMAGE:"user switching",TAG:TAG_ACCOUNT]];
        
        let sectionThree:[NSDictionary] = [[TITLE:"通知设置",IMAGE:"notification settings",TAG:TAG_NOTIC]];
        
        let sectionFour:[NSDictionary] = [[TITLE:"意见反馈",IMAGE:"feedback",TAG:TAG_FEEDBACK],
                                          [TITLE:"常见问题",IMAGE:"problem",TAG:TAG_QUESTION],
                                          [TITLE:"检查更新",IMAGE:"update",TAG:TAG_VERSION]];
        
        dataArray .add(sectionTwo);
        dataArray .add(sectionThree);
        dataArray .add(sectionFour);
    }
    
    func exitAction(_ button:UIButton) {
        
        UserDefaults.standard.set(false, forKey: "Login");
        UserDefaults.standard.synchronize();
        self.showLoginVC(fromVC: self);
    }
    
    func changeAccountAction(_ button:UIButton) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
//MARK: UITableViewDelegate
extension LCSettingController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowArray:NSArray = dataArray .object(at: section) as! NSArray
        
        return rowArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 2 {
            
            return 180;
        }
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
        
        if section == 2 {
            
            footerView.frame = CGRect(x:0,y:0,width:width,height:180);
            
            
            let exitButton = UIButton.init(frame: CGRect(x:30,y:40,width:width - 60,height:40));
            exitButton.layer.cornerRadius = 4;
            exitButton.layer.masksToBounds = true;
            exitButton .setTitle("退出当前帐号", for: UIControlState.normal);
            exitButton.titleLabel?.font = UIFont.kTitleFont();
            exitButton.setTitleColor(UIColor.white, for: UIControlState.normal);
            exitButton.backgroundColor = UIColor.orange;
            exitButton .addTarget(self, action: #selector(exitAction(_:)), for: UIControlEvents.touchUpInside);
            footerView .addSubview(exitButton);
           
            
            let changeButton = UIButton.init(frame: CGRect(x:30,y:exitButton.frame.maxY + 20,width:width - 60,height:40));
            changeButton.layer.cornerRadius = 4;
            changeButton.layer.masksToBounds = true;
            changeButton.titleLabel?.font = UIFont.kTitleFont();
            changeButton .setTitle("切换账号", for: UIControlState.normal);
            changeButton.setTitleColor(UIColor.white, for: UIControlState.normal);
            changeButton.backgroundColor = UIColor.kMainBlueColor();
            changeButton .addTarget(self, action: #selector(changeAccountAction(_:)), for: UIControlEvents.touchUpInside);
            footerView .addSubview(changeButton);
            
        }
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let array = dataArray[indexPath.section] as! [NSDictionary]
        let dic = array[indexPath.row];
        
        let title = dic[TITLE];
        let imageString = dic[IMAGE];
        
        cell?.imageView?.image = UIImage (named: imageString as! String)
        cell?.textLabel?.text = title as? String
        cell?.textLabel?.font = UIFont.kNormalFont();
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
        let array = dataArray[indexPath.section] as! [NSDictionary]
        let dic = array[indexPath.row];
        
        let title = dic[TITLE];
        NSLog("选择:\(title)")
    }
}
