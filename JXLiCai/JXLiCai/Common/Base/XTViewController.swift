//
//  XTViewController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit
import SnapKit


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
        //修改导航条背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.kMainBlueColor();//UIColor.init(red: 30/255.0, green: 144/255.0, blue: 255/255.0, alpha: 1);
        //修改导航条标题颜色（白色）
        self.navigationController?.navigationBar .titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white];
        //修改导航条添加的按钮（item）颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        self.showDismissButtonItem()
    }
        
    func showLoginVC(fromVC:UIViewController){
    
        
        let login = LCLoginController.init(nibName: "LCLoginController", bundle: Bundle.main)
        if fromVC is LCMyController{
            
            login.isLogOut = true;
        }
        
        let navLogin = XTNaviagtionController.init(rootViewController: login);
        
        fromVC .present(navLogin, animated: true, completion: {
            
        });
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
    
    func hiddenLeftButtonItem() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target:self, action:nil);
        
    }
    
    //计算文本宽高
    func getTextHeigh(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        
        let normalText: NSString = textStr as NSString
        let size = CGSize.init(width: width, height: 1000)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
        return stringSize.height
    }
    
    func getTexWidth(textStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let normalText: NSString = textStr as NSString
        
        let size = CGSize.init(width: 1000, height: height)
        
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
        
        return stringSize.width
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
