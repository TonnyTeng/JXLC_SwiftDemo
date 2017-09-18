//
//  LCPayController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/15.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCPayController: XTViewController {

    var tableView = UITableView()
    var dataArray = NSMutableArray()
    var passWordView = LCEnterPassWordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "支付"
        self.view.backgroundColor = UIColor.groupTableViewBackground;
        self .configDataSource();
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
        tableView.rowHeight = 60;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
    }
    
    func configDataSource() {
        
        dataArray .add(["image":"icon_account","title":"账户余额","context":"3840元","status":"1"])
        dataArray .add(["image":"icon_bank_00","title":"招商银行(尾号0355)","context":"本次最大可支付2万元","status":"0"])
        dataArray .add(["image":"icon_bank_01","title":"建设银行(尾号6602)","context":"本次最大可支付2万元","status":"0"])
        dataArray .add(["image":"icon_bank_02","title":"农业银行(尾号1277)","context":"本次最大可支付2万元","status":"0"])
    }
    
    func surePassWordAction() {
        
        passWordView .cancelShowEnterPassWordView();
        let paySuccessVC = LCPaySuccessController.init()
        self.navigationController?.pushViewController(paySuccessVC, animated: true);
    }
    
    func surePayAction() {
        
        passWordView = LCEnterPassWordView.init(frame: CGRect(x:0,y:0,width:width,height:height));
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(passWordView);
        passWordView .showEnterPassWordView();
        passWordView.sureButton .addTarget(self, action: #selector(surePassWordAction), for: UIControlEvents.touchUpInside);
//        let paySuccessVC = LCPaySuccessController.init()
//        self.navigationController?.pushViewController(paySuccessVC, animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
//MARK: UITableViewDelegate
extension LCPayController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 2;
        }else{
            
            return dataArray.count;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            
            return 0.1;
        }else{
            
            return 44;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            
            return 0.1;
        }
        return 140;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:44))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        if section == 1 {
            
            
            let titleLabel = UILabel.init(frame: CGRect(x:15,y:12,width:width - 30,height:20));
            titleLabel.font = UIFont.kNormalFont();
            titleLabel.text = "请选择支付方式";
            headerView .addSubview(titleLabel);
           
        }else{
            
            headerView.frame.size.height = 0.1
        }
         return headerView;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:0.1))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        if section == 1 {
            
            footerView.frame.size.height = 100;
            
            let bottomButton = UIButton.init(frame: CGRect(x:15,y:25,width:width - 30,height:50));
            bottomButton.backgroundColor = UIColor.kMainYellowColor()
            bottomButton.layer.cornerRadius = 4;
            bottomButton.setTitle("立即购买", for: UIControlState.normal);
            bottomButton.setTitleColor(UIColor.white, for: UIControlState.normal);
            bottomButton.titleLabel?.font = UIFont.kBFont(x: 18);
            bottomButton.addTarget(self, action:#selector(surePayAction), for:UIControlEvents.touchUpInside);
            footerView .addSubview(bottomButton);
            
            let safeButton = UIButton.init(frame: CGRect(x:15,y:bottomButton.frame.maxY + 10,width:width - 30,height:30));
            safeButton .setImage(UIImage.init(named: "icon_safety"), for: UIControlState.normal);
            safeButton.titleLabel?.font = UIFont.kFont(x:14);
            safeButton.setTitleColor(UIColor.red, for: UIControlState.normal)
            safeButton.setTitle("京县理财为用户绑定的银行卡提供安全保障", for: UIControlState.normal);
            footerView .addSubview(safeButton);
            
        }
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.value1, reuseIdentifier: cellId)
            cell?.accessoryType = UITableViewCellAccessoryType.none
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        if indexPath.section == 0  {
            
            if indexPath.row == 0 {
                
                cell?.textLabel?.text = "星河宝-12月起"
                cell?.textLabel?.font = UIFont.kBFont(x:18);
            }else{
            
                cell?.textLabel?.text = "购买金额"
                cell?.textLabel?.textColor = UIColor.lightGray;
                cell?.textLabel?.font = UIFont.kNormalFont();
                
                cell?.detailTextLabel?.font = UIFont.kSmallFont();
                cell?.detailTextLabel?.textColor = UIColor.kMainYellowColor();
                cell?.detailTextLabel?.text = "2000.0";
            }
           
            
        }else{
            
            let  accessoryButton = UIButton.init(frame: CGRect(x:0,y:0,width:16,height:16));
            accessoryButton.setImage(UIImage.init(named: "icon_normal_choose"), for: UIControlState.normal);
            accessoryButton.setImage(UIImage.init(named: "icon_selected_choose"), for: UIControlState.selected);
            cell?.accessoryView = accessoryButton;
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            let dic = dataArray[indexPath.row] as! NSDictionary ;
            
            let title = dic["title"];
            let imageString = dic["image"];
            let context = dic["context"];
            let status = dic["status"] as? String;
            if status == "1" {
                
                accessoryButton.isSelected = true;
            }else{
            
                accessoryButton.isSelected = false;
            }
            
            cell?.imageView?.image = UIImage (named: imageString as! String)
            cell?.textLabel?.text = title as? String
            cell?.textLabel?.font = UIFont.kNormalFont();
            
            cell?.detailTextLabel?.font = UIFont.kSmallFont();
            cell?.detailTextLabel?.textColor = UIColor.lightGray;
            cell?.detailTextLabel?.text = context as? String;
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
        if indexPath.section == 1 {
            
            let dic = dataArray[indexPath.row] as! NSDictionary ;
            let status = dic["status"] as? String;
            let array = NSArray.init(array: dataArray);
            dataArray .removeAllObjects();
            for index in 0..<array.count{
                
                let oldDic = NSMutableDictionary.init(dictionary: array[index] as!NSDictionary);
                
                if index == indexPath.row {
                    
                    if status == "1"  {
                        
                        oldDic.setValue("0", forKey: "status")
                    }else{
                        
                        oldDic.setValue("1", forKey: "status")
                    }
                }else{
                
                    oldDic.setValue("0", forKey: "status")
                }
               
                dataArray .add(oldDic);
            }
            tableView .reloadData();
        }
    }
}
