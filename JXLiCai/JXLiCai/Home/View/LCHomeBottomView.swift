//
//  LCHomeBottomView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/10.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCHomeBottomView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame);
        self.backgroundColor = UIColor.kRGBColor(r: 238, g: 238, b: 238);
        
        
        let leftImageView = UIImageView.init(frame: CGRect(x:(width / 2 - 64 - 40 - 5) / 2,y:20,width:40,height:35));
        leftImageView.image = UIImage.init(named: "Rookie help");
        self.addSubview(leftImageView);
       
        let leftTitleLabel = UILabel.init(frame: CGRect(x:leftImageView.frame.maxX + 5,y:20,width:100,height:20));
        leftTitleLabel.font = UIFont.kTitleFont();
        leftTitleLabel.text = "新手帮助";
        self.addSubview(leftTitleLabel);
        
        
        let leftSubLabel = UILabel.init(frame: CGRect(x:leftImageView.frame.maxX + 5,y:20 + 35 - 20,width:100,height:20));
        leftSubLabel.textColor = UIColor.darkGray;
        leftSubLabel.font = UIFont.kNormalFont();
        leftSubLabel.text = "图文教程";
        self.addSubview(leftSubLabel);
        
        
        
        let rightImageView = UIImageView.init(frame: CGRect(x:width / 2 + (width / 2 - 32 - 5 - 84) / 2,y:20,width:32,height:36));
        rightImageView.image = UIImage.init(named: "security");
        self.addSubview(rightImageView);
        
        
        let rightTitleLabel = UILabel.init(frame: CGRect(x:rightImageView.frame.maxX + 5,y:20,width:100,height:20));
        rightTitleLabel.font = UIFont.kTitleFont();
        rightTitleLabel.text = "安全保障";
        self.addSubview(rightTitleLabel);
        
        
        let rightSubLabel = UILabel.init(frame: CGRect(x:rightImageView.frame.maxX + 5,y:20 + 35 - 20,width:100,height:20));
        rightSubLabel.textColor = UIColor.darkGray;
        rightSubLabel.font = UIFont.kNormalFont();
        rightSubLabel.text = "专业风控团队";
        self.addSubview(rightSubLabel);
        
        
        
        let leftButton = UIButton.init(frame: CGRect(x:0,y:0,width:width / 2,height:frame.height));
        leftButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        leftButton.tag = 100;
        self.addSubview(leftButton);
        
        
        let rightButton = UIButton.init(frame: CGRect(x:width / 2,y:0,width:width / 2,height:frame.height));
        rightButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        rightButton.tag = 101;
        self.addSubview(rightButton);
        
        
    }
    
    
    func clickAction(_ button:UIButton){
        
        NSLog("\(button.titleLabel?.text)");
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
