//
//  LCFinancialDetailsController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/12.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

let UITableViewCellTagNone              = "1"
let UITableViewCellTagType              = "2"
let UITableViewCellTagDetails           = "3"
let UITableViewCellTagSafe              = "4"
let UITableViewCellTagInput             = "5"

class LCFinancialDetailsController: XTViewController {

    var tableView = UITableView()
    var bottomButton = UIButton()
    var dataArray = NSMutableArray()
    var headerView:JXDetailsHeaderView!
    let headerHeight:CGFloat    = 391 * 414 / 750//391 * width / 750
    var textField = UITextField()
    
    var leftButton = UIButton()
    var rightButton = UIButton()
    
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
        
        self .configUI();
        self .configDataSource();
        
    }
    func backAction() {
        
        self.navigationController?.popViewController(animated: true);
    }
    
    func buyAction(_ button:UIButton) {
       
        
        let showSettingPWDView = arc4random() % 2;
        if showSettingPWDView == 1 {
            
            let alertView = UIAlertController.init(title: "设置支付密码", message: "您还没有设置支付密码,设置成功后才能购买产品哟!", preferredStyle: UIAlertControllerStyle.alert);
            let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
                
                
            })
            
            let sureAction = UIAlertAction.init(title: "设置", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                
                let payPWDVC = LCPayPassWordController.init();
                payPWDVC.clickNextAction = self.clickNextAction;
                self.navigationController?.pushViewController(payPWDVC, animated: true);
            })
            //修改取消按钮字体颜色
            cancelAction .setValue(UIColor.lightGray, forKey: "titleTextColor");
            
            alertView .addAction(sureAction);
            alertView .addAction(cancelAction);
            self .present(alertView, animated: true, completion: nil);
        }else{
        
            self.clickNextAction();
        }
    }
    
    func clickNextAction()->Void{
        
        let payVC = LCPayController.init();
        self.navigationController?.pushViewController(payVC, animated: true);
    }
    
    func incomeAction() {
        
        if textField.text != "" &&  Float(textField.text!)! >= 100 {
            
            textField.text = "\(Float(textField.text!)! - 100)"
        }
    }
    
    func addAction() {
        
        if  textField.text == "" {
            
            textField.text = "100"
        }else{
        
            textField.text = "\(Float(textField.text!)! + 100)"
        }
        self .refreshButtonColorAction();
    }
    func refreshButtonColorAction() {
        
        if  textField.text != "" &&  Float(textField.text!)! >= 100  {
            
             leftButton.backgroundColor = UIColor.kMainYellowColor();
        }else{
             leftButton.backgroundColor = UIColor.groupTableViewBackground;
        }
    }
    func configUI() {
    
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:0,width:width,height:height - 50), style:UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        
        bottomButton = UIButton.init(frame: CGRect(x:0,y:height - 50,width:width,height:50));
        bottomButton.backgroundColor = UIColor.kMainYellowColor()
        bottomButton.setTitle("立即购买", for: UIControlState.normal);
        bottomButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        bottomButton.titleLabel?.font = UIFont.kBFont(x: 18);
        bottomButton.addTarget(self, action:#selector(buyAction(_:)), for:UIControlEvents.touchUpInside);
        self.view .addSubview(bottomButton);
        
    }
    
    func configDataSource() {
        
        let sectionOne:[NSDictionary] = [[TITLE:" ",TAG:UITableViewCellTagNone]];
        
        let sectionTwo:[NSDictionary] = [[TITLE:"还款方式",TAG:UITableViewCellTagType]];
        
        let sectionThree:[NSDictionary] = [[TITLE:"产品详情",TAG:UITableViewCellTagDetails],
                                           [TITLE:"资金保障",TAG:UITableViewCellTagSafe]];
        
        let sectionFour:[NSDictionary] = [[TITLE:"投资输入",TAG:UITableViewCellTagInput]];
        
        dataArray .add([sectionOne]);
        dataArray .add(sectionTwo);
        dataArray .add(sectionThree);
        dataArray .add(sectionFour);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: UITableViewDelegate
extension LCFinancialDetailsController: UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowArray:NSArray = dataArray .object(at: section) as! NSArray
        
        return rowArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 2 {
            
            return 44;
        }else{
            
            if indexPath.section == 0 {
                
                return 80;
            }else if indexPath.section == 1{
            
                return 44 + 85;
            }else{
            
                return 185;
            }
            
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
        if section == 3 {
            
            return 60;
        }
        return 0.1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 0 {
            headerView = JXDetailsHeaderView.init(frame: CGRect(x:0,y:0,width:width,height:headerHeight))
            headerView.backButton .addTarget(self, action: #selector(backAction), for: UIControlEvents.touchUpInside);
            headerView.configDataWithModel(model: ["1":"2"]);
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
        
        if section == 3 {
            
            footerView.frame = CGRect(x:0,y:0,width:width,height:40);
            
            let moneyLabel = UILabel.init(frame: CGRect(x:15,y:20,width:width - 30,height:20));
            moneyLabel.font = UIFont.kFont(x:14);
            moneyLabel.textAlignment = NSTextAlignment.center;
            moneyLabel.textColor = UIColor.red;
            moneyLabel.text = "同比银行收益多0元";
            footerView .addSubview(moneyLabel);
            
        }
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId\(indexPath.row)\(indexPath.section)"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        for view:(UIView) in (cell?.contentView.subviews)! {
            
            view .removeFromSuperview();
        }
        if indexPath.section == 2 {
            cell?.textLabel?.font = UIFont.kNormalFont();
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            if indexPath.row == 0 {
                
                cell?.textLabel?.text = "产品详情"
            }else{
            
               cell?.textLabel?.text = "资金保障"
            }
        }
        else{
        
            cell?.accessoryType = UITableViewCellAccessoryType.none;
            
            if indexPath.section == 0 {
                cell?.selectionStyle = UITableViewCellSelectionStyle.none;
                
                let lineView = UIView.init(frame: CGRect(x:15,y:80 - 20,width:width - 30,height:8));
                lineView.layer.cornerRadius = 4;
                lineView.backgroundColor = UIColor.lightGray;
                cell?.contentView .addSubview(lineView);
                
                let blueView = UIView.init(frame: CGRect(x:15,y:80 - 20,width:0,height:8));
                blueView.layer.cornerRadius = 4;
                blueView.backgroundColor = UIColor.kMainBlueColor();
                cell?.contentView .addSubview(blueView);
                
                let imageView = UIImageView.init(frame: CGRect(x:0,y:blueView.frame.minY - 45,width:104,height:45))
                imageView.image = UIImage.init(named: "bg_00-1");
                cell?.contentView .addSubview(imageView);
                
                let progressLabel = UILabel.init(frame: CGRect(x:0,y:0,width:104,height:40));
                progressLabel.textAlignment = NSTextAlignment.center;
                progressLabel.textColor = UIColor.white;
                progressLabel.text = "已购0.0%";
                imageView .addSubview(progressLabel);
                
                
                let blueWidth = Int(arc4random_uniform(UInt32(width - 30)))
                let progress = CGFloat(CGFloat(blueWidth) / (width - 30));
                
                UIView.animate(withDuration: 0.8, animations: {
                    
                    blueView.frame.size.width = CGFloat(blueWidth);
                    if (blueView.frame.maxX - 65) < 0{
                    
                        imageView.frame.origin.x = 0;
                    }else if ((blueView.frame.maxX - 65) > (width - 15 - 104)){
                    
                        imageView.frame.origin.x = width - 15 - 104;
                        
                        
                    }else{
                    
                        imageView.frame.origin.x = (blueView.frame.maxX - 65) ;
                    }
                    
                    
                    progressLabel.text = "已购\(String(format: "%.1f", progress * 100) )%";
                });
                
            }
            else if(indexPath.section == 1 ){
            
                
                let startDateLabel = UILabel.init(frame: CGRect(x:15,y:15,width:width / 2 - 30,height:20));
                startDateLabel.font = UIFont.kNormalFont();
                startDateLabel.textColor = UIColor.black;
                startDateLabel.text = "2017-09-15";
                cell?.contentView .addSubview(startDateLabel);
                
                let startLabel = UILabel.init(frame: CGRect(x:15,y:startDateLabel.frame.maxY + 5,width:width - 30,height:20));
                startLabel.font = UIFont.kNormalFont();
                startLabel.textColor = UIColor.lightGray;
                startLabel.text = "收益起息日";
                cell?.contentView .addSubview(startLabel);
                
                
                
                let endDateLabel = UILabel.init(frame: CGRect(x:width / 2,y:15,width:width / 2 - 15,height:20));
                endDateLabel.font = UIFont.kNormalFont();
                endDateLabel.textAlignment = NSTextAlignment.right;
                endDateLabel.textColor = UIColor.black;
                endDateLabel.text = "2017-10-15";
                cell?.contentView .addSubview(endDateLabel);
                
                
                
                let endLabel = UILabel.init(frame: CGRect(x:width / 2,y:endDateLabel.frame.maxY + 5,width:width / 2 - 15,height:20));
                endLabel.font = UIFont.kNormalFont();
                endLabel.textAlignment = NSTextAlignment.right;
                endLabel.textColor = UIColor.lightGray;
                endLabel.text = "收益到期日";
                cell?.contentView .addSubview(endLabel);
                
                
                let lineView = UIView.init(frame: CGRect(x:0,y:endLabel.frame.maxY + 15,width:width,height:0.4));
                lineView.backgroundColor = UIColor.lightGray;
                cell?.contentView .addSubview(lineView);
                
                let verticalLineView = UIView.init(frame: CGRect(x:width / 2 - 0.2,y:0,width:0.4,height:lineView.frame.maxY));
                verticalLineView.backgroundColor = UIColor.lightGray;
                cell?.contentView .addSubview(verticalLineView);
                
                
                let titleLabel = UILabel.init(frame: CGRect(x:15,y:lineView.frame.maxY + 15,width:width - 30,height:20));
                titleLabel.font = UIFont.kNormalFont();
                titleLabel.textColor = UIColor.black;
                titleLabel.text = "还款方式";
                cell?.contentView .addSubview(titleLabel);
                
                let rightLabel = UILabel.init(frame: CGRect(x:15,y:lineView.frame.maxY + 15,width:width - 30,height:20));
                rightLabel.textAlignment = NSTextAlignment.right;
                rightLabel.font = UIFont.kNormalFont();
                rightLabel.textColor = UIColor.lightGray;
                rightLabel.text = "按日付息，到期还本";
                cell?.contentView .addSubview(rightLabel);
                
            }
            else{
            
                cell?.selectionStyle = UITableViewCellSelectionStyle.none;
                
                let titleLabel = UILabel.init(frame: CGRect(x:15,y:10,width:width - 30,height:20));
                titleLabel.font = UIFont.kNormalFont();
                titleLabel.textColor = UIColor.black;
                titleLabel.text = "投资输入";
                cell?.contentView .addSubview(titleLabel);
                
               
                leftButton = UIButton.init(frame: CGRect(x:15,y:titleLabel.frame.maxY + 20,width:50,height:50))
                leftButton.backgroundColor = UIColor.groupTableViewBackground;
                leftButton.setTitleColor(UIColor.white, for: UIControlState.normal);
                leftButton.setTitle("-", for: UIControlState.normal);
                leftButton.titleLabel?.font = UIFont.kBFont(x: 40);
                leftButton.layer.cornerRadius = 4;
                leftButton .addTarget(self, action: #selector(incomeAction), for: UIControlEvents.touchUpInside);
                cell?.contentView .addSubview(leftButton)
                
                
                
                rightButton = UIButton.init(frame: CGRect(x:width - 15 - 50,y:titleLabel.frame.maxY + 20,width:50,height:50))
                rightButton.backgroundColor = UIColor.kMainYellowColor();
                rightButton.setTitleColor(UIColor.white, for: UIControlState.normal);
                rightButton.setTitle("+", for: UIControlState.normal);
                rightButton.titleLabel?.font = UIFont.kBFont(x: 40);
                rightButton.layer.cornerRadius = 4;
                rightButton .addTarget(self, action: #selector(addAction), for: UIControlEvents.touchUpInside);
                cell?.contentView .addSubview(rightButton)
                
                textField = UITextField.init(frame: CGRect(x:80,y:titleLabel.frame.maxY + 20,width:width - 60 - 100,height:50));
                textField.layer.borderColor = UIColor.lightGray.cgColor;
                textField.layer.borderWidth = 0.4;
                textField.layer.cornerRadius = 5;
                textField.layer.masksToBounds = true;
                textField.placeholder = "起投金额100元";
                textField.backgroundColor = UIColor.white;
                textField.keyboardType = UIKeyboardType.decimalPad;
                textField.textAlignment = NSTextAlignment.center;
                textField.delegate = self;
                cell?.contentView .addSubview(textField);
                
                
                let moneyTitleLabel = UILabel.init(frame: CGRect(x:15,y:textField.frame.maxY + 20,width:width - 30,height:20));
                moneyTitleLabel.font = UIFont.kNormalFont();
                moneyTitleLabel.textAlignment = NSTextAlignment.center;
                moneyTitleLabel.textColor = UIColor.lightGray;
                moneyTitleLabel.text = "预计可收益(元)";
                cell?.contentView .addSubview(moneyTitleLabel);
                
                
                let moneyLabel = UILabel.init(frame: CGRect(x:15,y:moneyTitleLabel.frame.maxY + 5,width:width - 30,height:20));
                moneyLabel.font = UIFont.kBFont(x:20);
                moneyLabel.textAlignment = NSTextAlignment.center;
                moneyLabel.textColor = UIColor.kMainYellowColor();
                moneyLabel.text = "0";
                cell?.contentView .addSubview(moneyLabel);
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
        if indexPath.section == 2 {
        
            
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        self .refreshButtonColorAction();

        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    
        self .refreshButtonColorAction();
    }
    
}
