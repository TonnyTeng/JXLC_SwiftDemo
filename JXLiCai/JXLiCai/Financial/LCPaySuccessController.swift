//
//  LCPaySuccessController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/15.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCPaySuccessController: XTViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "购买成功";
        self.view.backgroundColor = UIColor.groupTableViewBackground;
        self .configUI();
        
    }
    func configUI() {
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        tableView .reloadData();
    }
    
    func paySuccessAction(){
        
        self.navigationController?.popToRootViewController(animated: true);
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
//MARK: UITableViewDelegate
extension LCPaySuccessController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 3 {
            
            return 35;
        }else{
        
            return 44
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 114;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 110;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:54))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        
        let successImageView = UIImageView.init(frame: CGRect(x:width / 2 - 22,y:20,width:44,height:44));
        successImageView.image = UIImage.init(named: "icon_buy");
        headerView .addSubview(successImageView);
        
        let moneyLabel = UILabel.init(frame: CGRect(x:15,y:successImageView.frame.maxY + 10,width:width - 30,height:20));
        moneyLabel.textAlignment = NSTextAlignment.center;
        moneyLabel.font = UIFont.kFont(x: 20);
        moneyLabel.text = "恭喜你,购买成功!";
        headerView .addSubview(moneyLabel)
        
        return headerView;
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:110))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        let bottomButton = UIButton.init(frame: CGRect(x:15,y:30,width:width - 30,height:50));
        bottomButton.layer.cornerRadius = 4;
        bottomButton.backgroundColor = UIColor.kMainYellowColor()
        bottomButton.setTitle("确认", for: UIControlState.normal);
        bottomButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        bottomButton.titleLabel?.font = UIFont.kTitleFont();
        bottomButton.addTarget(self, action:#selector(paySuccessAction), for:UIControlEvents.touchUpInside);
        footerView .addSubview(bottomButton);
        
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId\(indexPath.row)\(indexPath.section)"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell (style: UITableViewCellStyle.value1, reuseIdentifier: cellId)
            cell?.accessoryType = UITableViewCellAccessoryType.none;
            cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        }
        if indexPath.row == 3 {
            
            cell?.textLabel?.text = "*京县理财为用户绑定的银行卡提高安全保障"
            cell?.textLabel?.font = UIFont.kSmallFont();
            cell?.textLabel?.textColor = UIColor.red;
            
        }else{
            
            cell?.textLabel?.font = UIFont.kNormalFont();
            cell?.textLabel?.textColor = UIColor.lightGray;
            cell?.detailTextLabel?.font = UIFont.kSmallFont();
            cell?.detailTextLabel?.textColor = UIColor.black;
            if indexPath.row == 0 {
                
                cell?.textLabel?.text = "购买金额"
                cell?.detailTextLabel?.text = "2000元"
            }else if(indexPath.row == 1){
            
                cell?.textLabel?.text = "预计收益"
                cell?.detailTextLabel?.text = "80.00元"
            }else{
            
                cell?.textLabel?.text = "预计回收"
                cell?.detailTextLabel?.text = "2080.88元"
            }
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
    }
}
