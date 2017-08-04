//
//  LCPassWordController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/31.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit


let TAG_TEL                 = "1"
let TAG_CODE                = "2"
let TAG_PWD                 = "3"
let TAG_NPWD                = "4"

class LCPassWordController: XTViewController {

    var tableView = UITableView()
    var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "忘记密码";
        
        self .configDataSource();
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height), style:UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 44.0;
        self.view.addSubview(tableView);
        
    }
    
    func configDataSource() {
        
        
        dataArray .add(["title":"手 机 号","text":"请输入手机号",          "tag":TAG_TEL]);
        dataArray .add(["title":"验 证 码","text":"请输入您的验证码",       "tag":TAG_CODE]);
        dataArray .add(["title":"登录密码","text":"请设置新的登录密码",      "tag":TAG_PWD]);
        dataArray .add(["title":"确认密码","text":"请确认您的新登录密码",    "tag":TAG_NPWD]);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//MARK: UITableViewDelegate
extension LCPassWordController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 120;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:120))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        
//        let dic = NSDictionary(dataArray[indexPath.row]);
//        let title = dic["title"];
        cell?.textLabel?.text = title;
        
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
        NSLog("选择:\(title)")
    }
}
