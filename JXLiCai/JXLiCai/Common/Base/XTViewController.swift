//
//  XTViewController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit
let width                   = UIScreen.main.bounds.size.width
let height                  = UIScreen.main.bounds.size.height




class XTViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
       

        
//        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
//        self.navigationController?.setNavigationBarHidden(false, animated: false);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground;
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 74/255.0, green: 169/255.0, blue: 248/255.0, alpha: 1);
        self.showDismissButtonItem()
    }
    
    func login(isLogin:Bool){
        
        let login = LCLoginController.init(nibName: "LCLoginController", bundle: Bundle.main)
        if isLogin {
            
            self.navigationController?.pushViewController(login, animated: true)
        }else{
            self.navigationController?.pushViewController(login, animated: true)
        }
        
    }
    
    func dismissAction(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
//    func showBackButtonItem() {
//        
//        
//    }
    func showDismissButtonItem() {
        
        var  backImage = UIImage(named:"go_back")
//        backImage = backImage.imageWithRenderingMode:(UIImageRenderingMode)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: backImage, style: UIBarButtonItemStyle.done, target:self, action:#selector(dismissAction))
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
