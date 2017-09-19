//
//  LCAddBankController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/19.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

//typealias AddBankInfo = (_ dic:NSDictionary)->Void;


class LCAddBankController: XTViewController {

//    var addBankInfo = AddBankInfo()
    var tableView = UITableView()
    var dataArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "添加银行卡";
        self.configUI();
    }

    func configUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false;
        tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
        tableView.rowHeight = 50;
        tableView.delegate = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        self .configDataSource();
    }
    func configDataSource() {
        
        dataArray .add(["title":"姓      名","place":"请输入姓名","tag":"1"]);
        dataArray .add(["title":"身 份 证 号","place":"请输入身份证号","tag":"2"]);
        dataArray .add(["title":"银      行","place":"请选择银行","tag":"3"]);
        dataArray .add(["title":"银 行 卡 号","place":"请输入银行卡号","tag":"4"]);
    }
    
    func nextAction(_ button:UIButton) {
        
        let addVC = LCBankAddTelController.init();
        self.navigationController?.pushViewController(addVC, animated: true);
    }
  
    func readStatusAction(_ button:UIButton) {
        
        button.isSelected = !button.isSelected;
    }
    func showDelegateAction(_ button:UIButton) {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LCAddBankController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = UIImageView.init(frame: CGRect(x:0,y:0,width:width,height:10))
        headerView.backgroundColor = UIColor.groupTableViewBackground;
        
        return headerView;
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 110;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:110))
        footerView.backgroundColor = UIColor.groupTableViewBackground;
        
        let addButton = UIButton.init(frame: CGRect(x:30,y:50,width:width - 60,height:50));
        addButton.layer.cornerRadius = 20;
        addButton.layer.masksToBounds = true;
        addButton.setTitle("下一步", for: UIControlState.normal);
        addButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        addButton.titleLabel?.font = UIFont.kTitleFont();
        addButton.backgroundColor = UIColor.kMainBlueColor();
        addButton.addTarget(self, action: #selector(nextAction(_:)), for: UIControlEvents.touchUpInside);
        footerView.addSubview(addButton);
       
        
        let readButton = UIButton.init(frame: CGRect(x:width / 2 - 245 / 2,y:addButton.frame.maxY + 10,width:120,height:30));
        readButton.setTitle("我已经阅读并同意", for: UIControlState.normal);
        readButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal);
        readButton.setImage(UIImage.init(named: "icon_normal_choose"), for: UIControlState.normal);
        readButton.setImage(UIImage.init(named: "icon_selected_choose"), for: UIControlState.selected);
        readButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 0);
        readButton.titleLabel?.font = UIFont.kSmallFont();
        readButton.addTarget(self, action: #selector(readStatusAction(_:)), for: UIControlEvents.touchUpInside);
        footerView.addSubview(readButton);
        
        let delegateButton = UIButton.init(frame: CGRect(x:readButton.frame.maxX,y:addButton.frame.maxY + 10,width:125,height:30));
        delegateButton.setTitle("《京县理财服务协议》", for: UIControlState.normal);
        delegateButton.setTitleColor(UIColor.kMainBlueColor(), for: UIControlState.normal);
        delegateButton.titleLabel?.font = UIFont.kSmallFont();
        delegateButton.addTarget(self, action: #selector(showDelegateAction(_:)), for: UIControlEvents.touchUpInside);
        footerView.addSubview(delegateButton);
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: LCBaseTextFieldCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as? LCBaseTextFieldCell
        if cell == nil {
            cell = LCBaseTextFieldCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            
            cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        }
        if indexPath.row == 2 {
            
            cell?.textField.isEnabled = false;
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        }else{
        
            cell?.accessoryType = UITableViewCellAccessoryType.none;
        }
        let dic = dataArray[indexPath.row] as!NSDictionary;
        cell?.titleLabel.text = dic["title"] as?String
        cell?.textField.placeholder = dic["place"] as?String;
        cell?.tag = Int(dic["tag"] as!String)!;
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
    }
}
