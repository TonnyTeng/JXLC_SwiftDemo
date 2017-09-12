//
//  LCMoneyFullView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/15.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit



class LCMoneyFullView: UIView {

    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        let imageView = UIImageView.init(frame: CGRect(x:0,y:0,width:frame.width,height:frame.height));
        imageView.image = UIImage.init(named: "bg_00");
        imageView.isUserInteractionEnabled = true;
        self.addSubview(imageView);
        
        //http://iosfonts.com
        let familyName = UIFont.familyNames;
        let maxIndex = familyName.count;
        let index = (Int)(arc4random() % 10);
        
        titleLabel = UILabel.init(frame: CGRect(x:30,y:50,width:frame.size.width - 60,height:50));
        titleLabel.text = "本次活动已结束\n距离下次活动开始还有";
        titleLabel.font = UIFont.init(name:"ArialRoundedMTBold ", size:20)
        titleLabel.textColor = UIColor .white;
        titleLabel.textAlignment = NSTextAlignment.center;
        titleLabel.numberOfLines = 0;
        imageView .addSubview(titleLabel);
        
        
        let timeView = LCTimerView.init(frame: CGRect(x:0,y:titleLabel.frame.maxY + 30,width:width,height:55));
        imageView .addSubview(timeView);
        
        
        let detailButton = UIButton.init(frame: CGRect(x:(width - 180 ) / 2,y:timeView.frame.maxY + 30,width:180,height:50));
        detailButton.setTitle("查看详情", for: UIControlState.normal);
        detailButton.setTitleColor(UIColor.kMainBlueColor(), for: UIControlState.normal);
        detailButton.backgroundColor = UIColor.white;
        detailButton.layer.cornerRadius = 10;
//        detailButton.layer.borderColor = UIColor.orange.cgColor;
//        detailButton.layer.borderWidth = 1;
        detailButton.layer.masksToBounds = true;
//        detailButton.setTitleColor(UIColor.orange, for: UIControlState.normal);
        detailButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        detailButton.tag = 103;
        imageView.addSubview(detailButton);
        
        
    }
    
    func clickAction(_ button:UIButton){
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
















