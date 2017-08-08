//
//  LCActivityDetailController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/7.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCActivityDetailController: PushViewController {

    var adImageView     = UIImageView()//广告
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "活动详情"
        adImageView = UIImageView.init(frame: CGRect(x:0,y:64 ,width:width,height:height - 64))
        adImageView.image = UIImage(named:"detail")
        view .addSubview(adImageView)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
