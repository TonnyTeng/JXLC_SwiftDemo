//
//  LCWealthRecordController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/18.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCWealthRecordController: XTViewController {

    var scrollView = UIScrollView()
    var segmentControl = UISegmentedControl()
    var chargeArray    = NSMutableArray() //as! [NSDictionary]
    var cashArray      = NSMutableArray() //as! [NSDictionary]
    var backMoneyArray = NSMutableArray() //as! [NSDictionary]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "财富记录";
        self.configData();
        self.configUI();
    }
    
    func configData(){
        
        chargeArray .add(["logo":"icon_bank_00","title":"中国建设银行","money":"2000.0元","date":"2017-09-18 15:22","status":"1"]);
        chargeArray .add(["logo":"icon_bank_01","title":"中国农业银行","money":"100.0元", "date":"2017-04-18 18:22","status":"0"]);
        chargeArray .add(["logo":"icon_bank_02","title":"中国招商银行","money":"600.0元", "date":"2017-07-18 09:22","status":"1"]);
        
        cashArray .add(["logo":"icon_bank_00","title":"提现到 - 中国建设银行","money":"2000.0元","date":"2017-09-18 15:22","status":"1"]);
        cashArray .add(["logo":"icon_bank_01","title":"提现到 - 中国农业银行","money":"100.0元", "date":"2017-04-18 18:22","status":"0"]);
        cashArray .add(["logo":"icon_bank_02","title":"提现到 - 中国招商银行","money":"600.0元", "date":"2017-07-18 09:22","status":"1"]);
        
        
        backMoneyArray .add(["logo":" ","title":"星河宝 12月起 20%","money":"+2000.0元","old":"本金：2000","status":"1"]);
        backMoneyArray .add(["logo":" ","title":"附回报 9月起 18%","money":"100.0元", "old":"本金：2000","status":"0"]);
        backMoneyArray .add(["logo":" ","title":"哈哈宝 3月起 10%","money":"600.0元", "old":"本金：2000","status":"1"]);
        
    }
    
    func configUI(){
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
        segmentControl = UISegmentedControl.init(items: ["充值","提现","返息"]);
        segmentControl.tintColor = UIColor.kMainBlueColor();
        segmentControl.selectedSegmentIndex = 0;
        segmentControl.frame = CGRect(x:15,y:10 + 64,width:width - 30,height:40);
        segmentControl.addTarget(self, action: #selector(changeRecordType(_ :)), for: UIControlEvents.valueChanged);
        view.addSubview(segmentControl);
        
        scrollView = UIScrollView.init(frame: CGRect(x:0,y:segmentControl.frame.maxY + 10,width:width,height:height - segmentControl.frame.maxY - 10));
        scrollView.contentSize = CGSize(width:width * CGFloat(self.segmentControl.numberOfSegments),height:height - segmentControl.frame.maxY - 10);
        scrollView.isPagingEnabled = true;
        scrollView.delegate = self;
        view .addSubview(scrollView);
        
        
        for index in 0..<self.segmentControl.numberOfSegments{
            
            let rect = CGRect(x:(CGFloat)(index) * width, y:0, width:width, height:scrollView.frame.height);
            let tableView = self.getTableView(rect: rect, tag: index + 100);
            self.scrollView .addSubview(tableView);
        }
    }
    
    func getTableView(rect:CGRect,tag:Int)-> UITableView{
        
        let tableView = UITableView.init(frame: rect, style: UITableViewStyle.grouped);
        tableView.tag = tag;
        tableView.tableFooterView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:0.1));
        tableView.tableHeaderView = UIView.init(frame: CGRect(x:0,y:0,width:width,height:0.1));
        tableView.rowHeight = 80;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        return tableView;
    }
    
    func changeRecordType(_ sender: UISegmentedControl) {
        
        let point = CGPoint(x:CGFloat(sender.selectedSegmentIndex) * width,y:0);
        self.scrollView .setContentOffset(point, animated: true);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LCWealthRecordController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 102 {
            
            return backMoneyArray.count;
        }else if tableView.tag == 101{
            
            return cashArray.count;
        }else{
            
            return chargeArray.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId: String = "LCWealthRecordCellID"
        var cell: LCWealthRecordCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as? LCWealthRecordCell
        if cell == nil {
            cell = LCWealthRecordCell (style: UITableViewCellStyle.default, reuseIdentifier: cellId)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.accessoryType = UITableViewCellAccessoryType.none;
        }
        if tableView.tag == 102 {
            
            cell?.configDataWithModel(model: backMoneyArray[indexPath.row] as! NSDictionary, tag:tableView.tag);
        }else if tableView.tag == 101{
        
            cell?.configDataWithModel(model: cashArray[indexPath.row] as! NSDictionary, tag:tableView.tag);
        }else{
        
            cell?.configDataWithModel(model: chargeArray[indexPath.row] as! NSDictionary, tag:tableView.tag);
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
        
//        let detailsVC = LCFinancialDetailsController.init();
//        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    //MARK - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset;
        NSLog("偏移量:\(offset)");
        self.segmentControl.selectedSegmentIndex = Int(offset.x / width);
    }
}
