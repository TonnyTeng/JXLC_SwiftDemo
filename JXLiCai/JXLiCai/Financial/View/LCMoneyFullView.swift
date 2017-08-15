//
//  LCMoneyFullView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/15.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit


//class customView: UIImageView {
//    
//    let titleLabel:UILabel!
//    
//  
//    override init(frame: CGRect) {
//        
////        super.init(frame: frame);
//        self.image = UIImage.init(named:"bg_time");
//        
//        
//        
//        
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        
//        fatalError("init(coder:) has not been implemented")
//    }
//}


class LCMoneyFullView: UIView {

    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        let imageView = UIImageView.init(frame: CGRect(x:0,y:0,width:frame.width,height:frame.height));
        imageView.image = UIImage.init(named: "bg_00");
        imageView.isUserInteractionEnabled = true;
        self.addSubview(imageView);
        
        
        let detailButton = UIButton.init(frame: CGRect(x:(width - 180 ) / 2,y:frame.size.height / 2 - 50,width:180,height:50));
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
        self.addSubview(detailButton);
        
        
    }
    
    func clickAction(_ button:UIButton){
        
        
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
