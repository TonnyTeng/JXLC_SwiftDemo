//
//  LCRegisterController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/28.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCRegisterController: XTViewController {

    @IBOutlet weak var telTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var verificationTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var verificationButton: UIButton!
    
    @IBOutlet weak var delegateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册";
        self .configUI();
    }
    
    func configUI(){
        
        verificationButton.layer.cornerRadius = 4;
        registerButton.layer.cornerRadius = 4;
        telTextField.keyboardType = UIKeyboardType.numberPad;
        verificationTextField.keyboardType = UIKeyboardType.numberPad;
    }

    @IBAction func getVerificationAction(_ sender: UIButton) {
        
        NSLog("getVerificationAction");
        self.verificationButton.setTitle("60s后重新获取", for: UIControlState.normal);
    }
    @IBAction func registerAction(_ sender: UIButton) {
        
        
        NSLog("registerAction");
        self.navigationController?.popToRootViewController(animated: true);
    }
    
    @IBAction func showDelegateAction(_ sender: UIButton) {
        
         NSLog("showDelegateAction");
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
