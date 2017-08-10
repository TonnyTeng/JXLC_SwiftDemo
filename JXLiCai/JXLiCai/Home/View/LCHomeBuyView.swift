//
//  LCHomeBuyView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/10.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCHomeBuyView: UIView {

    var titleLabel:UILabel!
    var progressLabel:UILabel!
    var detailsButton:UIButton!
    
    var nameLabel:UILabel!
    var subNameLabel:UILabel!
    var buyButton:UIButton!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        let imageView = UIImageView.init(frame: CGRect(x:0,y:20,width:width,height:width * 296 / 573));
        imageView.image = UIImage.init(named: "product_bg");
        imageView.isUserInteractionEnabled = true;
        self.addSubview(imageView);
        
        let backButton = UIButton.init(frame: CGRect(x:0,y:20 + imageView.frame.height / 2,width:50,height:50));
        backButton.setImage(UIImage.init(named: "Go to a wealth management product"), for: UIControlState.normal);
        backButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        backButton.tag = 100;
        self.addSubview(backButton);
        
        let nextButton = UIButton.init(frame: CGRect(x:width - 50,y:20 + imageView.frame.height / 2,width:50,height:50));
        nextButton.setImage(UIImage.init(named: "The next financial product"), for: UIControlState.normal);
        nextButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        nextButton.tag = 101;
        self.addSubview(nextButton);
        
        progressLabel = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:30));
        progressLabel.center = CGPoint(x:width/2,y:20 + imageView.frame.height / 2);
        progressLabel.textAlignment = NSTextAlignment.center;
        progressLabel.textColor = UIColor.white;
        progressLabel.font = UIFont.kBFont(x: 25);
        progressLabel.text = "20%";
        self.addSubview(progressLabel);
        
        let lineView = UIView.init(frame:CGRect(x:0,y:0,width:80,height:0.4));
        lineView.center = CGPoint(x:width/2,y:progressLabel.frame.maxY + 1);
        lineView.backgroundColor = UIColor.white;
        self.addSubview(lineView);
        
        
        titleLabel = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20));
        titleLabel.center = CGPoint(x:width/2,y:progressLabel.frame.minY - 20);
        titleLabel.textAlignment = NSTextAlignment.center;
        titleLabel.textColor = UIColor.white;
        titleLabel.font = UIFont.kTitleFont();
        titleLabel.text = "年化收益";
        self.addSubview(titleLabel);
        
        
        detailsButton = UIButton.init(frame: CGRect(x:0,y:0,width:100,height:20));
        detailsButton.center = CGPoint(x:width/2,y:progressLabel.frame.maxY + 30);
        detailsButton.setTitle("查看详情", for: UIControlState.normal);
        detailsButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        detailsButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        detailsButton.tag = 102;
        self.addSubview(detailsButton);
        
        
        nameLabel = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20));
        nameLabel.center = CGPoint(x:width/2 - 50,y:imageView.frame.maxY + 30);
        nameLabel.textAlignment = NSTextAlignment.right;
//        nameLabel.textColor = UIColor.white;
        nameLabel.font = UIFont.kTitleFont();
        nameLabel.text = "祥和宝";
        self.addSubview(nameLabel);
        
        subNameLabel = UILabel.init(frame: CGRect(x:0,y:0,width:150,height:20));
        subNameLabel.center = CGPoint(x:width/2 + 85,y:imageView.frame.maxY + 30);
//        subNameLabel.textAlignment = NSTextAlignment.right;
        subNameLabel.textColor = UIColor.darkText;
        subNameLabel.font = UIFont.kNormalFont();
        subNameLabel.text = "定期理财 多种期限";
        self.addSubview(subNameLabel);
        
        buyButton = UIButton.init(frame: CGRect(x:30,y:frame.size.height - 70,width:width - 60,height:50));
        buyButton.setTitle("立即购买", for: UIControlState.normal);
        buyButton.layer.cornerRadius = 4;
        buyButton.layer.borderColor = UIColor.orange.cgColor;
        buyButton.layer.borderWidth = 1;
        buyButton.layer.masksToBounds = true;
        buyButton.setTitleColor(UIColor.orange, for: UIControlState.normal);
        buyButton.addTarget(self, action: #selector(clickAction(_:)), for: UIControlEvents.touchUpInside);
        buyButton.tag = 103;
        self.addSubview(buyButton);
    }
    
    
    func clickAction(_ button:UIButton){
    
        NSLog("\(button.titleLabel?.text)");
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
