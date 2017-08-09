//
//  LCFinancialController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCFinancialController: XTViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "理财";
        
        self.hiddenLeftButtonItem();
        //判断当前设备是否支持距离传感器
        if UIDevice.current.isProximityMonitoringEnabled {
            //            设备支持距离传感器
            NotificationCenter.default.addObserver(self, selector: #selector(changeFinancialType), name: NSNotification.Name.UIDeviceProximityStateDidChange, object: nil)
            
            //xxxxx 就是当靠近物体的时候需要执行的方法
        } else {
            //            不支持距离传感器
        }
        
    }

    @IBAction func changeFinancialType(_ sender: UISegmentedControl) {
        
        NSLog("\(sender)")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
