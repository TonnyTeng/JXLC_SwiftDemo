//
//  LCGiftController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/18.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCGiftController: XTViewController {

    var bottomButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "推荐有礼";
        self.configUI();
    }

    func configUI(){
        
        var imageView = UIImageView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64 - 50));
        imageView.image = UIImage.init(named: "gift");
        view.addSubview(imageView);
        
        bottomButton = UIButton.init(frame: CGRect(x:0,y:height - 50,width:width,height:50));
        bottomButton.backgroundColor = UIColor.kMainBlueColor();
        bottomButton .addTarget(self, action: #selector(shareGift), for: UIControlEvents.touchUpInside);
        bottomButton.setTitle("邀请好友,立即赚钱", for: UIControlState.normal);
        bottomButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        bottomButton.titleLabel?.font = UIFont.kTitleFont()
        view.addSubview(bottomButton)
    }
    
    func shareGift(){
        
        NSLog("分享...");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
