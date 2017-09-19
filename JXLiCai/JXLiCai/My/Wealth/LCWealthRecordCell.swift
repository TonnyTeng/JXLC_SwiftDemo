//
//  LCWealthRecordCell.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/18.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCWealthRecordCell: UITableViewCell {

    var bankImageView   = UIImageView()
    var bankNameLabel   = UILabel()
    var moneyLabel      = UILabel()
    var dateLabel       = UILabel()
    var statusLabel     = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        bankImageView = UIImageView.init(frame: CGRect(x:15,y:20,width:40,height:40));
        self.contentView .addSubview(bankImageView);
        
        bankNameLabel = UILabel.init(frame: CGRect(x:bankImageView.frame.maxX + 10,y:bankImageView.frame.minY - 5,width:width - bankImageView.frame.maxX - 10,height:20));
        bankNameLabel.font = UIFont.kNormalFont();
        self.contentView .addSubview(bankNameLabel);
       
        
        moneyLabel = UILabel.init(frame: CGRect(x:bankImageView.frame.maxX + 10,y:bankImageView.frame.minY - 5,width:width - bankImageView.frame.maxX - 10 - 15,height:20));
        moneyLabel.font = UIFont.kNormalFont();
        moneyLabel.textColor = UIColor.kMainYellowColor();
        moneyLabel.textAlignment = NSTextAlignment.right;
        self.contentView .addSubview(moneyLabel);
        
        
        dateLabel = UILabel.init(frame: CGRect(x:bankImageView.frame.maxX + 10,y:bankImageView.frame.maxY - 15,width:width - bankImageView.frame.maxX - 10,height:20));
        dateLabel.font = UIFont.kSmallFont();
        dateLabel.textColor = UIColor.lightGray;
        self.contentView .addSubview(dateLabel);
        
        statusLabel = UILabel.init(frame: CGRect(x:bankImageView.frame.maxX + 10,y:bankImageView.frame.maxY - 15,width:width - bankImageView.frame.maxX - 10 - 15,height:20));
        statusLabel.font = UIFont.kSmallFont();
        statusLabel.textColor = UIColor.lightGray;
        statusLabel.textAlignment = NSTextAlignment.right;
        self.contentView .addSubview(statusLabel);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configDataWithModel(model:NSDictionary, tag:Int){
        
     
        if tag == 100 {
        //充值
        
//            self.dateLabel.frame.origin.x = self.bankImageView.frame.maxX + 10;
//            self.bankNameLabel.frame.origin.x = self.bankImageView.frame.maxX + 10;
            
            self.bankImageView.image = UIImage.init(named: (model["logo"] as? String)!);
            self.bankNameLabel.text = model["title"] as? String;
            self.moneyLabel.text = model["money"] as? String;
            self.dateLabel.text = model["date"] as? String;
            
            if model["status"] as? String == "1" {
                
                self.statusLabel.text = "充值成功"
                moneyLabel.textColor = UIColor.kMainYellowColor();
            }else{
                
                self.statusLabel.text = "充值失败"
                self.moneyLabel.textColor = UIColor.lightGray;
            }
            
        }else if tag == 101{
        //提现
//            self.dateLabel.frame.origin.x = self.bankImageView.frame.maxX + 10;
//            self.bankNameLabel.frame.origin.x = self.bankImageView.frame.maxX + 10;

            
            self.bankImageView.image = UIImage.init(named: (model["logo"] as? String)!);
            self.bankNameLabel.text = model["title"] as? String;
            self.moneyLabel.text = model["money"] as? String;
            self.dateLabel.text = model["date"] as? String;
            
            if model["status"] as? String == "1" {
                
                self.statusLabel.text = "提现成功"
                moneyLabel.textColor = UIColor.kMainYellowColor();
            }else{
                
                self.statusLabel.text = "提现失败"
                self.moneyLabel.textColor = UIColor.lightGray;
            }
        }else{
        //返息
            
            self.dateLabel.frame.origin.x = 15;
            self.bankNameLabel.frame.origin.x = 15;
            
            self.bankImageView.isHidden = true;
    
            self.bankNameLabel.text = model["title"] as? String;
            self.moneyLabel.text = model["money"] as? String;
            self.dateLabel.text = model["old"] as? String;
            
            
            if model["status"] as? String == "1" {
                
                self.statusLabel.text = "已返息"
                moneyLabel.textColor = UIColor.kMainYellowColor();
            }else{
                
                self.statusLabel.text = "未返息"
                self.moneyLabel.textColor = UIColor.lightGray;
            }
        }
        
    }
    
}
