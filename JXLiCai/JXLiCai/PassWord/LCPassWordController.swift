//
//  LCPassWordController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/31.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit


let TAG_TEL                 = "1"
let TAG_CODE                = "2"
let TAG_PWD                 = "3"
let TAG_NPWD                = "4"

class LCPassWordController: XTViewController {

    var tableView = UITableView()
    var dataArray = NSMutableArray()
    
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
        self.title = "找回密码";
        
        self .configDataSource();
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height), style:UITableViewStyle.grouped);
        tableView.register(FindPassWordCell.self, forCellReuseIdentifier: "cellId");
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 50;
        self.view.addSubview(tableView);
        
    }
    
    func configDataSource() {
        
        
        dataArray .add(["title":"手 机 号","text":"请输入手机号",          "tag":TAG_TEL]);
        dataArray .add(["title":"验 证 码","text":"请输入您的验证码",       "tag":TAG_CODE]);
        dataArray .add(["title":"登录密码","text":"请设置新的登录密码",      "tag":TAG_PWD]);
        dataArray .add(["title":"确认密码","text":"请确认您的新登录密码",    "tag":TAG_NPWD]);
        
    }
    
    func startTimer(){
        
        let codeCell = self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as? FindPassWordCell;
        if second == 0 {
            
            codeCell?.subButton.setTitle("重新获取", for: UIControlState.normal);
            second = 60;
            self.timer.fireDate = NSDate.distantFuture;
        }else{
            
            second = second - 1;
            
            let title = "\( String(second))s后重新获取"
            codeCell?.subButton.setTitle(title, for: UIControlState.normal);
        }
    }
    
    // 实例化方法
    func createNSTimer()
    {
        self.timer = nil;
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true);
        
        RunLoop.current.add(self.timer, forMode: RunLoopMode.commonModes);
    }
    
    
    func sureAction() {
        
        let telCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? FindPassWordCell;
        NSLog("手机号：\(telCell?.textField.text)")
       
        let codeCell = self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as? FindPassWordCell;
        NSLog("验证码：\(codeCell?.textField.text)")
        
        let psdCell = self.tableView.cellForRow(at: IndexPath.init(row: 2, section: 0)) as? FindPassWordCell;
        NSLog("登录密码：\(psdCell?.textField.text)")
        
        let surePsdCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 0)) as? FindPassWordCell;
        NSLog("确认密码：\(surePsdCell?.textField.text)")
        
        self.navigationController?.popViewController(animated: true);
    }
    
    func subButtonAction(_ button:UIButton){
    
        button.isSelected = !button.isSelected;
        if button.tag == 101 {
            
            //倒计时
            if second == 60 || (self.timer == nil) {
                
                self.createNSTimer();
                let title = "\( String(second))s后重新获取"
                button.setTitle(title, for: UIControlState.normal);
            }
            
        }else if button.tag == 102{
        
            //显示密码
            UserDefaults.standard.set(button.isSelected, forKey: "FindPassWordLogin");
            UserDefaults.standard.synchronize();
            self.tableView.reloadData();
        }else{
        
            //显示确认密码
            UserDefaults.standard.set(button.isSelected, forKey: "FindPassWordSureLogin");
            UserDefaults.standard.synchronize();
            self.tableView.reloadData();
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view .endEditing(true);
        let textField = self.view.next;
        (textField as? UITextField)?.resignFirstResponder();
        
    }
}

/***
 MARK:extension 扩展
 • 添加计算型属性和计算型类型属性 • 定义实例方法和类型方法
 • 提供新的构造器
 • 定义下标
 • 定义和使用新的嵌套类型
 • 使一个已有类型符合某个协议-- 通过扩展来扩展一个已有类型，使其采纳一个或多个协议
 */

//MARK: UITableViewDelegate
extension LCPassWordController: UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 120;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:120))
        footerView.backgroundColor = UIColor.white;
        
        let button = UIButton.init(frame: CGRect(x:15,y:40,width:width - 30,height:40))
        button.setTitleColor(UIColor.white, for: UIControlState.normal);
        button.setTitle("确定", for: UIControlState.normal);
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        button.layer.cornerRadius = 4.0;
        button.backgroundColor = UIColor.init(red: 30/255.0, green: 144/255.0, blue: 255/255.0, alpha: 1);
        button.addTarget(self, action:#selector(sureAction), for:UIControlEvents.touchUpInside);
        footerView.addSubview(button)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: FindPassWordCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as! FindPassWordCell
        if cell == nil {
            cell = FindPassWordCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        cell?.config(model:dataArray[indexPath.row] as! NSDictionary);
        cell?.textField.delegate = self;
        if indexPath.row == 0 {
            
            cell?.subButton.isHidden = true;
            cell?.textField.keyboardType = UIKeyboardType.numberPad;
            
        } else  {
            
            if (indexPath.row == 1) {
                
                cell?.textField.keyboardType = UIKeyboardType.numberPad;
            }else{
            
                cell?.subButton.setTitle("", for: UIControlState.normal);
                cell?.subButton.backgroundColor = UIColor.clear;
                cell?.subButton.frame = CGRect(x:width - 27 - 15,y:25 - 6,width:27,height:11);
                
                if indexPath.row == 2 {
                    
                    cell?.subButton.isSelected = UserDefaults.standard.bool(forKey: "FindPassWordLogin")
                    
                }else{
                
                    cell?.subButton.isSelected = UserDefaults.standard.bool(forKey: "FindPassWordSureLogin")
                }
                
                cell?.textField.isSecureTextEntry = (cell?.subButton.isSelected)!;
                
                if (cell?.subButton.isSelected)! {
                    
                    cell?.subButton.setImage(UIImage.init(named: "icon_Shut"), for: UIControlState.normal);
                }else{
                    
                    cell?.subButton.setImage(UIImage.init(named: "icon_open"), for: UIControlState.normal);
                }
            }
            cell?.subButton.tag = indexPath.row + 100;
            cell?.subButton.addTarget(self, action:#selector(subButtonAction(_:)), for:UIControlEvents.touchUpInside);
        }
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
    }
    
    //MARK: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //限制位数
        return true;
    }
    
}

