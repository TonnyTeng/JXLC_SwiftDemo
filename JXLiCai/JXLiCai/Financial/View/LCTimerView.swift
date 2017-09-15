//
//  LCTimerView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/6.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCTimerView: UIView {

    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        //http://iosfonts.com
     
        let space:CGFloat = 5.0
        let textWidth:CGFloat = 20.0;
        var originX:CGFloat = ((frame.size.width - CGFloat(35.0 * 7.0) - space * 9.0 - textWidth * 3.0) / 2.0);
        var currentX:CGFloat = ((frame.size.width - CGFloat(35.0 * 7.0) - space * 9.0 - textWidth * 3.0) / 2.0);
        for i in 0..<7 {
            
            let button = UIButton.init(frame: CGRect(x:originX,y:0,width:35,height:55));
            button .setBackgroundImage(UIImage.init(named: "bg_time"), for: UIControlState.normal);
            button .setTitle("2", for: UIControlState.normal);
            button .setTitleColor(UIColor.kMainBlueColor(), for: UIControlState.normal);
            button.titleLabel?.font = UIFont.kBFont(x: 30);
            button.tag = 100 + i;
            self .addSubview(button);
            
            originX = button.frame.maxX + space;
            
            if i == 2 || i == 4 || i == 6{
                
                var type = "天";
                if i == 4 {
                    type = "时";
                }else if (i == 6){
                
                    type = "分";//秒
                }
                
                let dateLabel = UILabel.init(frame: CGRect(x:originX,y:0,width:textWidth,height:55));
                dateLabel.text = type;
                dateLabel.font = UIFont.systemFont(ofSize: 20);
                dateLabel.textColor = UIColor .white;
                dateLabel.textAlignment = NSTextAlignment.center;
                self .addSubview(dateLabel);
                
                originX = dateLabel.frame.maxX + space;
            }
        }
    }
    
    func clickAction(_ button:UIButton){
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
