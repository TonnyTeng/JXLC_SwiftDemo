//
//  XTTabBarController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class XTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
    
        NSLog("=========");
        
        return true;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
