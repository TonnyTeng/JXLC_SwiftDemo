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
        self.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension XTTabBarController:UITabBarControllerDelegate{

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        
        NSLog("=========");
        //选择 我的模块 && 未登录
        if viewController.childViewControllers.first is LCMyController &&
            !UserDefaults.standard.bool(forKey: "Login")
            {
            
                let login = LCLoginController.init(nibName: "LCLoginController", bundle: Bundle.main)
                let navLogin = XTNaviagtionController.init(rootViewController: login);
                
                viewController.childViewControllers.first? .present(navLogin, animated: true, completion: {
                    
                    self.selectedIndex = tabBarController.childViewControllers.count - 1;
                });
                return false;
        }
        return true;
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController){
    
        NSLog("@@@@@@@@@@@@@@@@@@@@@@");
    }
}
