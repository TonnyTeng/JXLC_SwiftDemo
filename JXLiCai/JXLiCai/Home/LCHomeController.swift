//
//  LCHomeController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

enum CompassPoint{

    case north
    case south
    case east
    case west
}

struct Student {
    
    var name:String
    var age:Int
    var sex:String
    var sorce:Float
    
}


class LCHomeController: XTViewController {

    var scrollView = UIScrollView()
    var cycleScrollView:CycleScrollView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        if (cycleScrollView != nil) {
            
            cycleScrollView!.reloadData()
        }

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: false);
        cycleScrollView?.timer?.invalidate()
        cycleScrollView?.timer = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页";
        
        scrollView = UIScrollView.init(frame: CGRect(x:0,y:0,width:width,height:height - 49))
        view .addSubview(scrollView)
        
//        let cycleHeight = 520 * width / 1080.0
        let frame = CGRect(x: 0, y: 0, width: width, height: cycleHeight)
        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
        
        cycleScrollView = CycleScrollView(frame: frame, type: .SERVICE, imgs: serverImages)
        cycleScrollView?.delegate = self
        scrollView.addSubview(cycleScrollView!)
        
        self.login(isLogin: true);
        self.configTopButton()
    }
    
    func configTopButton() {
        
        let space:Float = 15
//        let buttonWidth = (width - space * 2) / 4.0
        
        for i in 0..<3 {
            
            
            
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension LCHomeController: CycleScrollViewDelegate{
    
    // 点击图片事件
    func cycleScrollViewDidSelect(at index:Int, cycleScrollView:CycleScrollView)
    {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动事件
    func cycleScrollViewDidScroll(to index:Int, cycleScrollView:CycleScrollView)
    {
        print("滚动到了第\(index+1)个图片")
    }
    
   
}
