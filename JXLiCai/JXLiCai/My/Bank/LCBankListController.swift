//
//  LCBankListController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/18.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCBankListController: XTViewController {

    var tableView = UITableView()
    var dataArray = NSMutableArray()
    
    var tipsLabel = UILabel()
    var imageView = UIImageView()
    var addButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "银行卡";
        self.configUI();
        self.configDataSource();
    }
    func configUI(){
        
        if dataArray.count == 0 {
            
            let originY = height / 2 - 25;
            if !(view.subviews.contains(tipsLabel)) {
                
                tipsLabel = UILabel.init(frame: CGRect(x:15,y:originY - 20 - 60,width:width - 30,height:60));
                tipsLabel.numberOfLines = 0;
                tipsLabel.text = "添加银行卡\n即可享受安全便捷的移动理财服务";
                tipsLabel.textColor = UIColor.lightGray;
                tipsLabel.textAlignment = NSTextAlignment.center;
                tipsLabel.font = UIFont.kFont(x: 18);
                view.addSubview(tipsLabel);
            }
           
            if !(view.subviews.contains(imageView)) {
                
                imageView = UIImageView.init(frame: CGRect(x:width / 2 - 45,y:tipsLabel.frame.minY - 67 - 20,width:90,height:67));
                imageView.image = UIImage.init(named: "icon_card");
                view.addSubview(imageView);
            }
            
            if !(view.subviews.contains(addButton)) {
                
                addButton = UIButton.init(frame: CGRect(x:30,y:originY,width:width - 60,height:50));
                addButton.layer.cornerRadius = 20;
                addButton.layer.masksToBounds = true;
                addButton.setTitle("添加银行卡", for: UIControlState.normal);
                addButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal);
                addButton.setImage(UIImage.init(named: "icon_add-1"), for: UIControlState.normal);
                addButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 0);
                addButton.titleLabel?.font = UIFont.kTitleFont();
                addButton.backgroundColor = UIColor.white;
                addButton.addTarget(self, action: #selector(addBankAction(_:)), for: UIControlEvents.touchUpInside);
                view.addSubview(addButton);

            }
        }else{
        
            if !(view.subviews.contains(tableView)) {
                
                self.automaticallyAdjustsScrollViewInsets = false;
                tableView = UITableView.init(frame: CGRect(x:0,y:64,width:width,height:height - 64), style:UITableViewStyle.grouped);
                tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
                tableView.rowHeight = 120;
                tableView.delegate = self;
                tableView.dataSource = self;
                self.view.addSubview(tableView);
            }
           
        }
    }
    func configDataSource() {
        
        dataArray.add("");
        dataArray.add("");
        dataArray.add("");
        self.configUI();
    }

    func addBankAction(_ button:UIButton) {
        
        let addVC = LCAddBankController.init();
        self.navigationController?.pushViewController(addVC, animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LCBankListController:UITableViewDelegate, UITableViewDataSource {

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
     
        let addButton = UIButton.init(frame: CGRect(x:30,y:30.0,width:width - 60,height:50));
        addButton.layer.cornerRadius = 20;
        addButton.layer.masksToBounds = true;
        addButton.setTitle("添加银行卡", for: UIControlState.normal);
        addButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal);
        addButton.setImage(UIImage.init(named: "icon_add-1"), for: UIControlState.normal);
        addButton.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 0);
        addButton.titleLabel?.font = UIFont.kTitleFont();
        addButton.backgroundColor = UIColor.white;
        addButton.addTarget(self, action: #selector(addBankAction(_:)), for: UIControlEvents.touchUpInside);
        footerView.addSubview(addButton);
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "cellId"
        var cell: LCBankListCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as?LCBankListCell;
        if cell == nil {
            cell = LCBankListCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.accessoryType = UITableViewCellAccessoryType.none;
            cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        }
       

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
   
    }
}
