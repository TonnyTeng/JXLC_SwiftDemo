//
//  LCMessageHeaderView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/6.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCMessageHeaderView: UIView {

    var whiteView = UIView()
    
    var titleLabel = UILabel()
    var statusLabel = UILabel()
    var fromLabel = UILabel()
    var contextLabel = UILabel()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.groupTableViewBackground;
       
        
        whiteView = UIView.init(frame: CGRect(x:0,y:10,width:width,height:frame.size.height - 10));
        whiteView.backgroundColor = UIColor.white;
        self .addSubview(whiteView);
        
        
        titleLabel = UILabel.init(frame: CGRect(x:15,y:10,width:width - 100,height:20));
        titleLabel.font = UIFont.kTitleFont();
        titleLabel.textColor = UIColor.black;
        whiteView.addSubview(titleLabel);
       
        statusLabel = UILabel.init(frame: CGRect(x:100,y:10 + 5,width:10,height:10));
        statusLabel.layer.cornerRadius = 5;
        statusLabel.layer.masksToBounds = true;
        statusLabel.backgroundColor = UIColor.red;
        whiteView.addSubview(statusLabel);
        
        fromLabel = UILabel.init(frame: CGRect(x:width - 15 - 50,y:10,width:50,height:20));
        fromLabel.font = UIFont.kTitleFont();
        fromLabel.textAlignment = NSTextAlignment.center;
        fromLabel.textColor = UIColor.white;
        fromLabel.layer.cornerRadius = 8;
        fromLabel.layer.masksToBounds = true;
        fromLabel.backgroundColor = UIColor.kMainBlueColor();
        whiteView.addSubview(fromLabel);
        
        contextLabel = UILabel.init(frame: CGRect(x:15,y:40,width:width - 30,height:40));
        contextLabel.font = UIFont.kNormalFont();
        contextLabel.numberOfLines = 2;
        contextLabel.textColor = UIColor.lightGray;
        whiteView.addSubview(contextLabel);
    }
    
    
    func configData(dic:NSDictionary) {
        
        //["title":"京县理财升级通知","from":"系统","context":"各位客户，您好。京县理财将于2017年9月06日20:00进行系统升级。届时将理财业务停业，为各位带来的不便敬请理解！","status":"0",
        titleLabel.text = dic.value(forKey: "title") as?String;
        titleLabel .sizeToFit();
        
        if  dic.value(forKey: "status") as? String == "1"{
            
            statusLabel.isHidden = true;
        }else{
        
            statusLabel.frame = CGRect(x:titleLabel.frame.maxX + 5,y:10 + 5,width:10,height:10);
            statusLabel.isHidden = false;
        }
        
        if dic.value(forKey: "from") as?String == "系统" {
            
            fromLabel.backgroundColor = UIColor.kMainBlueColor();
        }else{
            fromLabel.backgroundColor = UIColor.red;
        }
        fromLabel.text = dic.value(forKey: "from") as?String;
        contextLabel.text = dic.value(forKey: "context") as?String;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
     
        //画横线
        /** OC 画线
         
             CGContextRef context = UIGraphicsGetCurrentContext();
             CGContextSetLineCap(context, kCGLineCapRound);
             CGContextSetLineWidth(context, 3);  //线宽
             CGContextSetAllowsAntialiasing(context, true);
             CGContextSetRGBStrokeColor(context, 70.0 / 255.0, 241.0 / 255.0, 241.0 / 255.0, 1.0);  //线的颜色
             CGContextBeginPath(context);
     
             CGContextMoveToPoint(context, 0, 0);  //起点坐标
             CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);   //终点坐标
             
             CGContextStrokePath(context);
         
         */
    }
}
