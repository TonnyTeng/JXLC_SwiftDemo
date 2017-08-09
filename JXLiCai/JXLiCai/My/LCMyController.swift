//
//  LCMyController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

let headerHeight:CGFloat    = 391 * 414 / 750//391 * width / 750

let cellIdentifier          = "cellIdentifier"
let TITLE                   = "title"
let IMAGE                   = "image"
let TAG                     = "tag"

let TAG_CHARGE              = "1"
let TAG_CASH                = "2"
let TAG_BANK                = "3"
let TAG_SAFE                = "4"
let TAG_CONTACT             = "5"

class LCMyController: XTViewController{

    var tableView = UITableView()
    var dataArray = NSMutableArray()
    var headerView:HeaderView!
    var myMoneyView:MyMoneyView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: false);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的";
        
        self .configDataSource();
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:0,width:width,height:height), style:UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
    }
    
    
    
    func configDataSource() {
        
        let sectionTwo:[NSDictionary] = [[TITLE:"充值",IMAGE:"recharge",TAG:TAG_CHARGE],
                                         [TITLE:"提现",IMAGE:"withdraw",TAG:TAG_CASH]];
        
        let sectionThree:[NSDictionary] = [[TITLE:"银行卡",IMAGE:"bank card",TAG:TAG_BANK],
                                           [TITLE:"安全中心",IMAGE:"security center",TAG:TAG_SAFE]];
        
        let sectionFour:[NSDictionary] = [[TITLE:"联系我们",IMAGE:"contact us",TAG:TAG_CONTACT]];
        
        dataArray .add([""]);
        dataArray .add([""]);
        dataArray .add(sectionTwo);
        dataArray .add(sectionThree);
        dataArray .add(sectionFour);
    }
  
    func messageAction() {
        
        NSLog("点击了消息")
        
    }
    
    func settingAction() {
        
        NSLog("点击了设置")
        self.login(isLogin: true);
    }
    
    func itemAction(_ button:UIButton) {
        
        
        NSLog("\(button.titleLabel!.text)");
    }
    
    //是否显示金额
    func sendValueClosure(_ selected:Bool)->Void{
    
        myMoneyView .showMoney(status: selected);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: UITableViewDelegate
extension LCMyController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowArray:NSArray = dataArray .object(at: section) as! NSArray
        
        return rowArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60;
        }
        else if indexPath.section == 1{
        
            return (width - 2) / 3;
        }else{
        
            return 44;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            
            return headerHeight;
        }else{
        
             return 10;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 0 {
            headerView = HeaderView.init(frame: CGRect(x:0,y:0,width:width,height:headerHeight))
            headerView.settingButton .addTarget(self, action: #selector(settingAction), for: UIControlEvents.touchUpInside);
            headerView.messageButton .addTarget(self, action: #selector(messageAction), for: UIControlEvents.touchUpInside);
            headerView.selectedStatus = sendValueClosure;
            return headerView;
        }else{
            
            let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:10))
            headerView.backgroundColor = UIColor.groupTableViewBackground;
            return headerView;
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:0.1))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        if indexPath.section == 0 || indexPath.section == 1 {
            
            cell?.accessoryType = UITableViewCellAccessoryType.none
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            if indexPath.section == 0 {
                
                myMoneyView = MyMoneyView.init(frame: CGRect(x:0,y:0,width:width,height:60));
                myMoneyView .configData(dic: ["use":"2103.00","all":"12321.3"]);
                myMoneyView .showMoney(status: true);
                cell?.contentView .addSubview(myMoneyView)
                
            }else{
                
                let titleArray = ["推荐有礼","我的投资","财富记录"];
                let imageArray = ["recommend","my investment","financial records"];
               
                let buttonWidth:CGFloat = (width - 2)/3
                
                for index in 0...2{
                
                    let button = UIButton.init(frame: CGRect(x:(buttonWidth + CGFloat(Float(index))) * CGFloat(Float(index)),y:0,width:buttonWidth,height:width/3));
                    button.setTitle(titleArray[index], for: UIControlState.normal);
                    button.titleLabel?.font = UIFont.kTitleFont();
                    button.setTitleColor(UIColor.black, for: UIControlState.normal);
                    button.setImage(UIImage(named:imageArray[index]), for: UIControlState.normal);
                    
                    
                    button .imageEdgeInsets = UIEdgeInsets.init(top: -(button.titleLabel?.intrinsicContentSize.height)!, left: 0, bottom: 0, right: -(button.titleLabel?.intrinsicContentSize.width)!);
                    button .titleEdgeInsets = UIEdgeInsets.init(top: (button.currentImage?.size.height)! + 10.0, left: -(button.currentImage?.size.width)!+10.0, bottom: 0, right: 0)
                    //传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号
                    button.addTarget(self, action:#selector(itemAction(_:)), for:UIControlEvents.touchUpInside);
                    button.tag = 100 + index;
                    cell?.contentView .addSubview(button);
                    
                    if index != 0 {
                        
                        let lineView = UIView.init(frame: CGRect(x:0.0,y:10.0,width:0.4,height:width/3 - 20.0));
                        lineView.backgroundColor = UIColor.gray;
                        button .addSubview(lineView);
                    }
                }
            }
            
        }else{
            
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            let array = dataArray[indexPath.section] as! [NSDictionary]
            let dic = array[indexPath.row];
            
            let title = dic[TITLE];
            let imageString = dic[IMAGE];
            
            cell?.imageView?.image = UIImage (named: imageString as! String)
            cell?.textLabel?.text = title as? String
        }
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

