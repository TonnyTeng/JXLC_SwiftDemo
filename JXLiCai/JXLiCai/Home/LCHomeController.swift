//
//  LCHomeController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/6/27.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit
import Alamofire
import ZKProgressHUD

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
        
        self.login(isLogin: true);
        self.configBackgroundView();
        self.configTopScrollView();
        self.configTopButton()
        
       /**
         
         ZKProgressHUD.show("正在拼命的加载中🏃🏃🏃")
         Alamofire.request("http://121.40.95.27/mobile/ss/queryClientImg.do?agentId=2000000122&appId=0000", method: .get).responseJSON {
         
         response in
         
         print(response.request)  // original URL request
         print(response.response) // HTTP URL response
         print(response.data)     // server data
         print(response.result)   // result of response serialization
         
         if let JSON = response.result.value {
         print("JSON: \(JSON)")
         }
         ZKProgressHUD.showInfo("加载完成😁😁😁")
         }
         
         */
        
    }
    //UI
    func configBackgroundView(){
        
        scrollView = UIScrollView.init(frame: CGRect(x:0,y:-20,width:width,height:height - 49 + 20))
        //        scrollView.contentSize = CGSize(width:width,height:height + 100);
        scrollView.backgroundColor = UIColor.white;
        view .addSubview(scrollView)
    }
    
    func configTopScrollView() {
        
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
    }
    
    func configTopButton() {
        
        let space:CGFloat = 15
        let buttonWidth = (width - space * 2) / 4.0
        let titleArray = ["福惠宝","祥和宝","财充盈","实惠宝"];
        let imageArray = ["FuHui treasure","Auspicious treasure","Goods with","Affordable treasure"];
        
        for i in 0..<4 {
            
            let originX = space + buttonWidth * CGFloat(i);
            let originY = (cycleScrollView?.frame.size.height)! + (cycleScrollView?.frame.origin.y)!;
            let button = UIButton.init(frame: CGRect(x:originX,y:originY,width:buttonWidth,height:buttonWidth))
            button.setTitle(titleArray[i], for: UIControlState.normal);
            button.setTitleColor(UIColor.black, for: UIControlState.normal);
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16);
            button.setImage(UIImage.init(named: imageArray[i]), for: UIControlState.normal);
            button .imageEdgeInsets = UIEdgeInsets.init(top: -(button.titleLabel?.intrinsicContentSize.height)!, left: 0, bottom: 0, right: -(button.titleLabel?.intrinsicContentSize.width)!);
            button .titleEdgeInsets = UIEdgeInsets.init(top: (button.currentImage?.size.height)! + 10.0, left: -(button.currentImage?.size.width)!+10.0, bottom: 0, right: 0)
            button.tag = 100 + i;
            button.addTarget(self, action: #selector(showAction(_:)), for: UIControlEvents.touchUpInside);
            scrollView.addSubview(button);
        }
    }
    
    //Action
    func showAction(_ button:UIButton) {
        
        NSLog("点击了:\(button.titleLabel?.text)");
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
