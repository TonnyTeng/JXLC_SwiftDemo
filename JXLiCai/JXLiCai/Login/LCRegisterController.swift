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
    var second = 60;//验证码倒计时
    var timer:Timer!;
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if self.timer != nil{
            
            self.timer.invalidate()
            self.timer = nil;
        }
    }
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
        telTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        verificationTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
    }

    func startTimer(){
      
        
        if second == 0 {
            
            self.verificationButton.setTitle("重新获取", for: UIControlState.normal);
            second = 60;
            self.timer.fireDate = NSDate.distantFuture;
        }else{
        
            second = second - 1;
            
            let title = "\( String(second))s后重新获取"
            self.verificationButton.setTitle(title, for: UIControlState.normal);
        }
    }
    
    // 实例化方法
    func createNSTimer()
    {
        self.timer = nil;
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true);
        
        RunLoop.current.add(self.timer, forMode: RunLoopMode.commonModes);
    }
    
    @IBAction func getVerificationAction(_ sender: UIButton) {
        
        NSLog("getVerificationAction");
        if second == 60 || (self.timer == nil) {
            
            self.createNSTimer();
            let title = "\( String(second))s后重新获取"
            self.verificationButton.setTitle(title, for: UIControlState.normal);
        }
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
