//
//  LCEnterPassWordView.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/15.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit


class LCEnterPassWordView: UIView {

    
    var backGroundButton = UIButton()
    var whiteView        = UIView()
    let whiteHeight      = CGFloat(44 * 3 + 40 + 44 + 50 + 20)
    var sureButton       = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backGroundButton = UIButton.init(frame: CGRect(x:0,y:0,width:width,height:height))
        backGroundButton.backgroundColor = UIColor.lightGray;//UIColor.kRGBAColor(r: 235, g: 235, b: 235, a: 0.6)
        backGroundButton.alpha = 0.4;
        backGroundButton .addTarget(self, action: #selector(cancelShowEnterPassWordView), for: UIControlEvents.touchUpInside)
        self .addSubview(backGroundButton);
        
        
        whiteView = UIView.init(frame:CGRect(x:30,y:height + 10,width:width - 60,height:whiteHeight))
        whiteView.backgroundColor = UIColor.white;
        whiteView.layer.cornerRadius = 8;
        self .addSubview(whiteView);
        
        let titleLabel = UILabel.init(frame: CGRect(x:15,y:12,width:whiteView.frame.size.width - 30,height:20));
        titleLabel.textAlignment = NSTextAlignment.center;
        titleLabel.font = UIFont.kTitleFont();
        titleLabel.textColor = UIColor.black;
        titleLabel.text = "请输入支付密码";
        whiteView .addSubview(titleLabel);
        
        
        let line1View = UIView.init(frame: CGRect(x:0,y:titleLabel.frame.maxY + 12 - 0.4,width:whiteView.frame.size.width,height:0.4));
        line1View.backgroundColor = UIColor.groupTableViewBackground;
        whiteView .addSubview(line1View);
        
        let moneyLabel = UILabel.init(frame: CGRect(x:15,y:line1View.frame.maxY + 12,width:whiteView.frame.size.width - 30,height:20));
        moneyLabel.textAlignment = NSTextAlignment.center;
        moneyLabel.font = UIFont.kTitleFont();
        moneyLabel.textColor = UIColor.kMainYellowColor();
        moneyLabel.text = "¥2000.00";
        whiteView .addSubview(moneyLabel);
        
        
        let line2View = UIView.init(frame: CGRect(x:15,y:moneyLabel.frame.maxY + 12 - 0.4,width:whiteView.frame.size.width - 30,height:0.4));
        line2View.backgroundColor = UIColor.groupTableViewBackground;
        whiteView .addSubview(line2View);
        
        let bankButton = UIButton.init(frame: CGRect(x:15,y:line2View.frame.maxY,width:whiteView.frame.size.width - 30,height:44));
        bankButton.setImage(UIImage.init(named: "icon_more"), for: UIControlState.normal);
        bankButton.setTitle("建设银行(尾号6602)", for: UIControlState.normal);
        bankButton.setTitleColor(UIColor.black, for: UIControlState.normal);
        bankButton .imageEdgeInsets = UIEdgeInsets.init(top:0.0 , left:whiteView.frame.size.width - (bankButton.imageView?.frame.size.width)! - 45, bottom: 0.0, right:0.0);
        bankButton.titleLabel?.font = UIFont.kNormalFont();
        bankButton .addTarget(self, action: #selector(selectorBankAction), for: UIControlEvents.touchUpInside);
        whiteView .addSubview(bankButton);
        
        let line3View = UIView.init(frame: CGRect(x:15,y:bankButton.frame.maxY,width:whiteView.frame.size.width - 30,height:0.4));
        line3View.backgroundColor = UIColor.groupTableViewBackground;
        whiteView .addSubview(line3View);
        
        let passWordView = LCPassWordView.init(frame: CGRect(x:15,y:line3View.frame.maxY + 20,width:whiteView.frame.size.width - 40,height:44))
        passWordView.lenght = 6
        passWordView.borderRadius = 8
        passWordView.delegate = self
        whiteView .addSubview(passWordView);
        
        let cancelButton = UIButton.init(frame: CGRect(x:15,y:passWordView.frame.maxY + 20,width:(whiteView.frame.size.width - 30 - 15) / 2,height:50))
        cancelButton.layer.cornerRadius = 4;
        cancelButton.backgroundColor = UIColor.lightGray;
        cancelButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        cancelButton.setTitle("取消", for: UIControlState.normal);
        cancelButton.titleLabel?.font = UIFont.kTitleFont();
        cancelButton .addTarget(self, action: #selector(cancelShowEnterPassWordView), for: UIControlEvents.touchUpInside);
        whiteView .addSubview(cancelButton);
       
        sureButton = UIButton.init(frame: CGRect(x:30 + (whiteView.frame.size.width - 30 - 30) / 2,y:passWordView.frame.maxY + 20,width:(whiteView.frame.size.width - 30 - 15) / 2,height:50))
        sureButton.layer.cornerRadius = 4;
        sureButton.backgroundColor = UIColor.kMainBlueColor();
        sureButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        sureButton.setTitle("确定", for: UIControlState.normal);
        sureButton.titleLabel?.font = UIFont.kTitleFont();
        
        whiteView .addSubview(sureButton);
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    
    }
    //选择银行卡
    func selectorBankAction(){
        
        
    }
    
    func cancelShowEnterPassWordView(){
        
        UIView.animate(withDuration: 0.6) { 
          
            self.whiteView.frame.origin.y = height + 10;
        };
        
        UIView.animate(withDuration: 0.6, animations: { 
            
        }) { (complete) in
            
            if complete{
            
                self.whiteView.removeFromSuperview();
                self.backGroundButton.removeFromSuperview();
                self.removeFromSuperview();
                //移除通知
                NotificationCenter.default.removeObserver(self)
            }
        }
    }
   
    func showEnterPassWordView(){
        
        UIView.animate(withDuration: 0.6) {
            
            self.whiteView.frame.origin.y = height / 2 - self.whiteHeight / 2;
        };
    }
    
    
    
    //键盘的出现
    func keyBoardWillShow(_ notification: Notification){
        
        let kbInfo = notification.userInfo//获取userInfo
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue//获取键盘的size
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double//键盘弹出的时间
        UIView.animate(withDuration: duration) {
            
            self.whiteView.frame.origin.y = height / 2 - self.whiteHeight / 2 - CGFloat(fabsf((Float(kbRect.origin.y - self.whiteView.frame.maxY))));
        }
    }
    
    //键盘的隐藏
    func keyBoardWillHide(_ notification: Notification){
        
        let kbInfo = notification.userInfo
        let kbRect = (kbInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = kbInfo?[UIKeyboardAnimationDurationUserInfoKey] as!Double
        UIView.animate(withDuration: duration) {
            self.whiteView.frame.origin.y = height / 2 - self.whiteHeight / 2;
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LCEnterPassWordView: LCPassWordViewDelegate{
    
    func entryComplete(password: String) {
        
//        label.text = "password: \(password)"
    }
    
}


