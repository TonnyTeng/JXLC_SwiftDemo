//
//  LCLoginController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCLoginController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var telButton: UIButton!
    @IBOutlet weak var passWordButton: UIButton!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
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

        self .configUI();
    }
    
    func configUI(){
        
        loginButton.layer.cornerRadius = 4;
        telTextField.keyboardType = UIKeyboardType.numberPad;
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        NSLog("loginAction")
        
        self.navigationController?.popViewController(animated: true);
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
        
    }
    @IBAction func showTelListAction(_ sender: UIButton) {
        
         NSLog("showTelListAction")
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
