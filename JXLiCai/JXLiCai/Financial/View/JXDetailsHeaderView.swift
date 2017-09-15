//
//  JXDetailsHeaderView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class JXDetailsHeaderView: UIImageView {

    var backButton:UIButton!
    var titleLabel:UILabel!
    var yearLabel:UILabel!//年化收益率
    var timeLabel:UILabel!//投资周期
    var moneyLabel:UILabel!//剩余可投资余额
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.image = UIImage (named: "personal center_bg");
        self.isUserInteractionEnabled = true;
        
        let heightView = frame.size.height;
        let originY:CGFloat = 20 + 64 / 2 - 25 / 2;
        let originX = frame.size.width - 25 - 15
        
        backButton = UIButton.init(frame: CGRect(x:15,y:originY,width:25,height:25))
        backButton .setImage(UIImage(named:"go_back"), for: UIControlState.normal);
//        backButton .addTarget(self, action: #selector(backAction(_:)), for: UIControlEvents.touchUpInside);
        self .addSubview(backButton)
        
        titleLabel = UILabel.init(frame: CGRect(x:0,y:backButton.frame.minY,width:width,height:25));
        titleLabel.textAlignment = NSTextAlignment.center;
        titleLabel.font = UIFont.kBFont(x: 18);
        titleLabel.textColor = UIColor.white;
        self .addSubview(titleLabel);
       
        yearLabel = UILabel.init(frame: CGRect(x:0,y:titleLabel.frame.maxY + 20,width:width,height:25));
        yearLabel.textAlignment = NSTextAlignment.center;
        yearLabel.font = UIFont.kBFont(x: 22);
        yearLabel.textColor = UIColor.white;
        self .addSubview(yearLabel);
        
        var year = UILabel.init(frame: CGRect(x:0,y:yearLabel.frame.maxY + 5,width:width,height:20));
        year.textAlignment = NSTextAlignment.center;
        year.font = UIFont.kFont(x: 16);
        year.text = "年化收益率";
        year.textColor = UIColor.kRGBColor(r: 194, g: 231, b: 252);
        self .addSubview(year);
        
        
        timeLabel = UILabel.init(frame: CGRect(x:5,y:year.frame.maxY + 20,width:width / 2 - 10,height:20));
        timeLabel.textAlignment = NSTextAlignment.center;
        timeLabel.font = UIFont.kFont(x: 20);
        timeLabel.textColor = UIColor.white;
        self .addSubview(timeLabel);
       
        var time = UILabel.init(frame: CGRect(x:5,y:timeLabel.frame.maxY + 5,width:width / 2 - 10,height:20));
        time.textAlignment = NSTextAlignment.center;
        time.font = UIFont.kFont(x: 16);
        time.text = "投资周期";
        time.textColor = UIColor.kRGBColor(r: 194, g: 231, b: 252);
        self .addSubview(time);
        
        
        var lineView = UIView.init(frame: CGRect(x:width / 2 - 0.5,y:timeLabel.frame.minY + 5,width:1,height:time.frame.maxY - timeLabel.frame.minY - 10));
        lineView.backgroundColor = UIColor.lightGray;
        self .addSubview(lineView);
        
        moneyLabel = UILabel.init(frame: CGRect(x:width / 2 + 5,y:year.frame.maxY + 20,width:width / 2 - 10,height:20));
        moneyLabel.textAlignment = NSTextAlignment.center;
        moneyLabel.font = UIFont.kFont(x: 20);
        moneyLabel.textColor = UIColor.white;
        self .addSubview(moneyLabel);
        
        var money = UILabel.init(frame: CGRect(x:width / 2 + 5,y:moneyLabel.frame.maxY + 5,width:width / 2 - 10,height:20));
        money.textAlignment = NSTextAlignment.center;
        money.font = UIFont.kFont(x: 16);
        money.text = "剩余可投资金额";
        money.textColor = UIColor.kRGBColor(r: 194, g: 231, b: 252);
        self .addSubview(money);
    }
    
    func configDataWithModel(model:NSDictionary){
    
        titleLabel.text = "香荷包-12月起";
        yearLabel.text = "7.9%";
        timeLabel.text = "31天";
        moneyLabel.text = "802102.32元";
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
