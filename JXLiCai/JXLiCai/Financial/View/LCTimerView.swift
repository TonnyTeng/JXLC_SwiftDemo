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
     
        let space = 5
        let textWidth = 20;
        let originX = Float((frame.size.width - 35 * 7 - space * 9 - textWidth * 3) / 2);
        
        for i in 0..<7 {
            
            let imageView = UIImageView.init(frame: CGRect(x:originX,y:0,width:35,height:55));
            imageView.image = UIImage.init(named: "bg_time");
            self.addSubview(imageView);
            
            
            let dateLabel = UILabel.init(frame: CGRect(x:0,y:50,width:frame.size.width - 60,height:50));
            dateLabel.text = "2";
            dateLabel.font = UIFont.systemFont(ofSize: 20);
            dateLabel.textColor = UIColor .white;
            dateLabel.textAlignment = NSTextAlignment.center;
            imageView .addSubview(dateLabel);
        }
        
        
        
    }
    
    func clickAction(_ button:UIButton){
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
