//
//  HeaderView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/28.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

let PortraitWidth:CGFloat = 80
//类似于OC中的typedef
typealias sendValueClosure = (_ selected:Bool)->Void


class HeaderView: UIImageView {

    var messageButton:UIButton!
    var settingButton:UIButton!
    
    var allMoneyButton:UIButton!
    var portraitButton:UIButton!
    
    var telLabel:UILabel!
    var moenyLabel:UILabel!
    
    var selectedStatus:sendValueClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.image = UIImage (named: "personal center_bg");
        self.isUserInteractionEnabled = true;
        
        let heightView = frame.size.height;
        let originY:CGFloat = 20 + 64 / 2 - 25 / 2;
        let originX = frame.size.width - 25 - 15
        
        messageButton = UIButton.init(frame: CGRect(x:15,y:originY,width:25,height:25))
        messageButton .setImage(UIImage(named:"news"), for: UIControlState.normal);
        self .addSubview(messageButton)
        
        settingButton = UIButton.init(frame: CGRect(x:originX,y:originY,width:25,height:25))
        settingButton .setImage(UIImage(named:"set up"), for: UIControlState.normal);
        self .addSubview(settingButton)
        
        portraitButton = UIButton.init(frame: CGRect(x:width/2 - PortraitWidth/2,y:originY,width:PortraitWidth,height:PortraitWidth))
        portraitButton .setImage(UIImage(named:"portrait"), for: UIControlState.normal);
//        portraitButton.backgroundColor = UIColor.white;
        portraitButton.layer.cornerRadius = PortraitWidth / 2;
        portraitButton.layer.masksToBounds = true;
        self .addSubview(portraitButton)
        
        telLabel = UILabel.init(frame: CGRect(x:0,y:originY + PortraitWidth + 5,width:width,height:20));
        telLabel.textAlignment = NSTextAlignment.center;
        telLabel.font = UIFont.systemFont(ofSize: 16);
        telLabel.textColor = UIColor.white;
        telLabel.text = "15884502959";
        self .addSubview(telLabel);
        
//        telLabel.sizeToFit();
        
        let originY_Tel:CGFloat = telLabel.frame.origin.y + telLabel.frame.size.height + 10.0;
        
        let space:CGFloat = (heightView - originY_Tel) / 2.0 - 60.0;
        
        allMoneyButton = UIButton.init(frame: CGRect(x:width/2 - 50.0,y:originY_Tel + space / 2.0,width:100,height:40))
        allMoneyButton .setImage(UIImage(named:"visible"), for: UIControlState.normal);
        allMoneyButton .setImage(UIImage(named:"invisible"), for: UIControlState.selected);
        allMoneyButton .setTitle("资产总计", for: UIControlState.normal);
        allMoneyButton.titleLabel?.textColor = UIColor.white;
        allMoneyButton.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        allMoneyButton .imageEdgeInsets = UIEdgeInsets.init(top:0.0 , left:(allMoneyButton.imageView?.frame.size.width)! + 70.0, bottom: 0.0, right: -(allMoneyButton.titleLabel?.bounds.size.width)!);
        allMoneyButton .titleEdgeInsets = UIEdgeInsets.init(top:0.0 , left: -(allMoneyButton.imageView?.frame.size.width)!, bottom: 0.0, right: (allMoneyButton.imageView?.frame.size.width)!);
        allMoneyButton .addTarget(self, action: #selector(showAction(_:)), for: UIControlEvents.touchUpInside);
        self .addSubview(allMoneyButton);
        
        moenyLabel = UILabel.init(frame: CGRect(x:0,y:originY_Tel + space / 2.0 + 40,width:width,height:20));
        moenyLabel.textAlignment = NSTextAlignment.center;
        moenyLabel.font = UIFont.systemFont(ofSize:18);
        moenyLabel.textColor = UIColor.white;
        moenyLabel.text = "1231223.00元";
        self .addSubview(moenyLabel);

    }
    
    func showMoney(status:Bool) {
        
        if status {
            
            moenyLabel.text = "1231223.00元";
        }else{
            
            moenyLabel.text = "******";
        }
    }
    
    func showAction(_ button:UIButton) {
        
        button.isSelected = !button.isSelected;
        self .showMoney(status: !button.isSelected);
        /**
         先判断闭包是否存在，然后再调用
         */
        if selectedStatus != nil {
            selectedStatus!(!button.isSelected);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
