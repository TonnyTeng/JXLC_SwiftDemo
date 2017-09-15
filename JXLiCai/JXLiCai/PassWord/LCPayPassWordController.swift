//
//  LCPayPassWordController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/15.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

//类似于OC中的typedef
typealias ClickNextAction = ()->Void

class LCPayPassWordController: XTViewController {

    var tableView = UITableView()
    var bottomButton = UIButton()
    var textField = UITextField()
    var sureTextField = UITextField()
    var clickNextAction:ClickNextAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "支付密码";
        self.view.backgroundColor = UIColor.groupTableViewBackground;
        self .configUI();
        
    }
    func configUI() {
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
        tableView.rowHeight = 44;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        tableView .reloadData();
    }

    func nextAction(){
        
        if clickNextAction != nil {
            
            self.navigationController?.popViewController(animated: false);
            clickNextAction!();
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: UITableViewDelegate
extension LCPayPassWordController: UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 54;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 110;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:54))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        
        
        let moneyLabel = UILabel.init(frame: CGRect(x:15,y:22,width:width - 30,height:20));
        moneyLabel.font = UIFont.kNormalFont();
        moneyLabel.text = "设置6位数的支付密码";
        headerView .addSubview(moneyLabel)
        
        return headerView;
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:110))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        let bottomButton = UIButton.init(frame: CGRect(x:15,y:30,width:width - 30,height:50));
        bottomButton.layer.cornerRadius = 4;
        bottomButton.backgroundColor = UIColor.kMainBlueColor()
        bottomButton.setTitle("下一步", for: UIControlState.normal);
        bottomButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        bottomButton.titleLabel?.font = UIFont.kNormalFont();
        bottomButton.addTarget(self, action:#selector(nextAction), for:UIControlEvents.touchUpInside);
        footerView .addSubview(bottomButton);
        
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId\(indexPath.row)\(indexPath.section)"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.accessoryType = UITableViewCellAccessoryType.none;
            cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        }
        for view:(UIView) in (cell?.contentView.subviews)! {
            
            view .removeFromSuperview();
        }
        cell?.textLabel?.font = UIFont.kNormalFont();
        if indexPath.row == 0 {
            
            cell?.textLabel?.text = "支付密码"
            textField = UITextField.init(frame: CGRect(x:100,y:7,width:width - 115,height:30))
            textField.clearButtonMode = UITextFieldViewMode.whileEditing;
            textField.font = UIFont.kNormalFont();
            textField.placeholder = "请输入支付密码";
            cell?.contentView .addSubview(textField);
            
        }else{
        
            sureTextField = UITextField.init(frame: CGRect(x:100,y:7,width:width - 115,height:30))
            sureTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
            sureTextField.font = UIFont.kNormalFont();
            sureTextField.placeholder = "请确认您的支付密码";
            cell?.contentView .addSubview(sureTextField);
            
            cell?.textLabel?.text = "确认密码"
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
    }
}
