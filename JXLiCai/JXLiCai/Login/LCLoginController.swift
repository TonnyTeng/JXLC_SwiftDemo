//
//  LCLoginController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit
import ZKProgressHUD
import Alamofire

class LCLoginController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var telButton: UIButton!
    @IBOutlet weak var passWordButton: UIButton!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    var isLogOut = false;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: true);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //下载图片
        Alamofire.download("https://httpbin.org/image/png").responseData { response in
            if let data = response.result.value {
                let image = UIImage(data: data)
                self.loginButton.setImage(image, for: UIControlState.normal);
            }
        }
        self .configUI();
    }
    
    func configUI(){
        
        loginButton.layer.cornerRadius = 4;
        telTextField.keyboardType = UIKeyboardType.numberPad;
        telTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        passWordTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        
        if isLogOut {
            
            self.dismiss(animated: false, completion: {
            
                //显示首页
                let tabBarVC:XTTabBarController = UIApplication.shared.keyWindow?.rootViewController as! XTTabBarController;
                tabBarVC.selectedIndex = 0;
                
            });
            
        }else{
        
            self.dismiss(animated: false, completion: {
                
                //显示首页
                let tabBarVC:XTTabBarController = UIApplication.shared.keyWindow?.rootViewController as! XTTabBarController;
                tabBarVC.selectedIndex = 0;
                
            });
        }
        
    }
    @IBAction func loginAction(_ sender: UIButton) {
        
        NSLog("loginAction")
        UserDefaults.standard.set(true, forKey: "Login");
        UserDefaults.standard.synchronize();
        
        ZKProgressHUD.show("正在拼命的加载中🏃🏃🏃")
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + .seconds(3), execute: {
            DispatchQueue.main.async {
                ZKProgressHUD.dismiss()
                self.dismiss(animated: true, completion: {
                    
                    //显示首页
//                    let tabBarVC:XTTabBarController = UIApplication.shared.keyWindow?.rootViewController as! XTTabBarController;
//                    tabBarVC.selectedIndex = 0;
                    
                });
//                self.navigationController?.popViewController(animated: true);
                //                ZKProgressHUD.showInfo("加载完成😁😁😁")
//                ZKProgressHUD.showSuccess("操作成功👏👏👏")
            }
        })
        
        
//        self.hidesBottomBarWhenPushed = false;
    }
    @IBAction func forgotPassWordAction(_ sender: UIButton) {
        
        NSLog("forgotPassWordAction")
        let passWordVC = LCPassWordController.init();
        
        self.navigationController?.pushViewController(passWordVC, animated: true)
    }
    @IBAction func registerAction(_ sender: UIButton) {
        
        NSLog("register")
        let registerVC = LCRegisterController.init(nibName: "LCRegisterController", bundle: Bundle.main)

        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    @IBAction func showStatusPassWordAction(_ sender: UIButton) {
        
         NSLog("showStatusPassWordAction")
        sender.isSelected = !sender.isSelected;
        passWordTextField.isSecureTextEntry = !sender.isSelected;
        if (!sender.isSelected) {
            
            sender.setImage(UIImage.init(named: "icon_Shut"), for: UIControlState.normal);
        }else{
            
            sender.setImage(UIImage.init(named: "icon_open"), for: UIControlState.normal);
        }
        
    }
    @IBAction func showTelListAction(_ sender: UIButton) {
        
        let headers: HTTPHeaders = [
//            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ]

        
        NSLog("showTelListAction")
        ZKProgressHUD.show("加载...")
        Alamofire.request("https://api.douban.com/v2/book/search", method: .get, parameters: ["tag":"Swift","count":10], encoding: JSONEncoding(options: []), headers:headers).responseJSON
            { response in
            
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            ZKProgressHUD.dismiss()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        telTextField.resignFirstResponder();
        passWordTextField.resignFirstResponder();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
