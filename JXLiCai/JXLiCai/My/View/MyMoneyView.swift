//
//  MyMoneyView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/28.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class MyMoneyView: UIImageView {

    var useTitleLabel:UILabel!
    var useCountLabel:UILabel!
    var allTitleLabel:UILabel!
    var allCountLabel:UILabel!
    
    var useCount:NSString?
    var allCount:NSString?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 58/255.0, green: 107/255.0, blue: 191/255.0, alpha: 1);
        
        let height = frame.size.height;
        let width = frame.size.width;
        
        useTitleLabel = UILabel.init(frame: CGRect(x:0,y:height/2 - 23.0 ,width:width/2,height:20));
        useTitleLabel.textAlignment = NSTextAlignment.center;
        useTitleLabel.font = UIFont.systemFont(ofSize: 16);
        useTitleLabel.textColor = UIColor.white;
        useTitleLabel.text = "可用余额";
        self .addSubview(useTitleLabel);
        
        useCountLabel = UILabel.init(frame: CGRect(x:0,y:height/2+3 ,width:width/2,height:20));
        useCountLabel.textAlignment = NSTextAlignment.center;
        useCountLabel.font = UIFont.systemFont(ofSize: 18);
        useCountLabel.textColor = UIColor.white;
       
        self .addSubview(useCountLabel);
        
        
        allTitleLabel = UILabel.init(frame: CGRect(x:width/2,y:height/2 - 23.0 ,width:width/2,height:20));
        allTitleLabel.textAlignment = NSTextAlignment.center;
        allTitleLabel.font = UIFont.systemFont(ofSize: 16);
        allTitleLabel.textColor = UIColor.white;
        allTitleLabel.text = "累计收益";
        self .addSubview(allTitleLabel);
        
        allCountLabel = UILabel.init(frame: CGRect(x:width/2,y:height/2+3 ,width:width/2,height:20));
        allCountLabel.textAlignment = NSTextAlignment.center;
        allCountLabel.font = UIFont.systemFont(ofSize: 18);
        allCountLabel.textColor = UIColor.white;
       
        self .addSubview(allCountLabel);
        
        let lineView = UIView.init(frame: CGRect(x:width / 2,y:0.0,width:0.4,height:height));
        lineView.backgroundColor = UIColor.gray;
        self.addSubview(lineView);
        
    }
    
    func configData(dic:NSDictionary){
        
//        useCount = dic["use"];
//        allCount = dic["all"];
        allCountLabel.text = "59620.00元";
        useCountLabel.text = "5960.00元";
        
    }
    
    func showMoney(status:Bool){
        
        if status {
            
            allCountLabel.text = "59620.00元";
            useCountLabel.text = "5960.00元";
        }else{
        
            allCountLabel.text = "****";
            useCountLabel.text = "****";
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
