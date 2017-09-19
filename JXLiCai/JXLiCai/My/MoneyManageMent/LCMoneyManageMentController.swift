//
//  LCMoneyManageMentController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/19.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

let maxMoney = "2000"

class LCMoneyManageMentController: XTViewController {

    var isCharge:Bool = true;
    var tableView = UITableView()
    var textField = UITextField()
    var passWordView = LCEnterPassWordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isCharge {
            
            self.title = "账户充值";
        }else{
        
            self.title = "账户提现";
        }
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
        tableView.rowHeight = 60;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        tableView.reloadData();
    }

    func bottomButtonAction(_ button:UIButton) {
        
        passWordView = LCEnterPassWordView.init(frame: CGRect(x:0,y:0,width:width,height:height));
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(passWordView);
        passWordView .showEnterPassWordView();
        passWordView.sureButton .addTarget(self, action: #selector(surePassWordAction), for: UIControlEvents.touchUpInside);
        passWordView.sureButton.backgroundColor = UIColor.kMainYellowColor();
        
    }
    
    
    func surePassWordAction() {
        
        passWordView .cancelShowEnterPassWordView();
        
        var status = "成功";
        if arc4random() % 2 == 1 {
            
            status = "失败";
        }
        
        var message = "提现\(status)";
        if isCharge {
            
            message = "充值\(status)";
        }
        let alertVC = UIAlertController.init(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let sureButton = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default) { (sureButton) in
            
            
        };
        alertVC.addAction(sureButton);
        self .present(alertVC, animated: true, completion: nil);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
//MARK: UITableViewDelegate
extension LCMoneyManageMentController: UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 270;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:10))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        
        return headerView;
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:220))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
            
        let whiteView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:120));
        whiteView.backgroundColor = UIColor.white;
        footerView .addSubview(whiteView);
        
        let moneyLabel = UILabel.init(frame:  CGRect(x:20,y:20,width:width - 40,height:20));
        moneyLabel.font = UIFont.kNormalFont();
        if isCharge {
            
            moneyLabel.text = "充值金额"
        }else{
        
            moneyLabel.text = "提现金额"
        }
        whiteView.addSubview(moneyLabel);
        
        let lineView = UIView.init(frame: CGRect(x:20,y:moneyLabel.frame.maxY + 20,width:width - 40,height:40));
        lineView.layer.cornerRadius = 4;
        lineView.layer.borderColor = UIColor.lightGray.cgColor;
        lineView.layer.borderWidth = 0.4;
        lineView.layer.masksToBounds = true;
        whiteView.addSubview(lineView);
        
        textField = UITextField.init(frame: CGRect(x:30,y:moneyLabel.frame.maxY + 20,width:width - 60,height:40))
        textField.font = UIFont.kNormalFont();
        textField.placeholder = "请输入\(moneyLabel.text!)";
        textField.delegate = self;
        textField.keyboardType = UIKeyboardType.decimalPad;
        whiteView.addSubview(textField);
        
        
        let tipsLabel = UILabel.init(frame:  CGRect(x:15,y:whiteView.frame.maxY + 20,width:width - 30,height:20));
        tipsLabel.font = UIFont.kSmallFont();
        if isCharge {
            
            tipsLabel.text = "单笔充值不超过\(maxMoney)元"
        }else{
            
            tipsLabel.text = "单笔提现不超过\(maxMoney)元"
        }
        
        tipsLabel.textColor = UIColor.kMainYellowColor();
        footerView.addSubview(tipsLabel);
        
        
        let button = UIButton.init(frame: CGRect(x:30,y:tipsLabel.frame.maxY + 30,width:width - 60,height:40));
        button.layer.cornerRadius = 4;
        button.layer.masksToBounds = true;
        var buttonTitle = "立即提现";
        if isCharge {
            
            buttonTitle = "立即充值";
        }
        
        button .setTitle(buttonTitle, for: UIControlState.normal);
        button.titleLabel?.font = UIFont.kTitleFont();
        button.setTitleColor(UIColor.white, for: UIControlState.normal);
        button.backgroundColor = UIColor.orange;
        button .addTarget(self, action: #selector(bottomButtonAction(_:)), for: UIControlEvents.touchUpInside);
        footerView .addSubview(button);
        
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.value1, reuseIdentifier: cellId)
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        cell?.textLabel?.text = "选择银行卡"
        cell?.textLabel?.font = UIFont.kNormalFont();
        
        cell?.detailTextLabel?.text = "招商银行"
        cell?.detailTextLabel?.font = UIFont.kSmallFont();
    
        let count = CGFloat((cell?.detailTextLabel?.text?.characters.count)!);
        
        let logoImageView = UIImageView.init(frame: CGRect(x:width - 15 - 30 - 12 * count - 20,y:20,width:20,height:20));
        logoImageView.image = UIImage.init(named: "icon_bank_02")
        cell?.contentView.addSubview(logoImageView);
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        if textField.text != nil && Float(textField.text!) > Float(maxMoney){
//            
//            
//        }
    }
    
}
