//
//  LXMessageDetailsController.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/6.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LXMessageDetailsController: XTViewController {

    var dic = NSDictionary()
    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息详情";
        self.configInfo();
    }

    func configInfo() {
        
        scrollView = UIScrollView.init(frame: CGRect(x:0,y:0,width:width,height:height - 64));
        scrollView.backgroundColor = UIColor.white;
        view .addSubview(scrollView);
        
        let titleLabel = UILabel.init(frame: CGRect(x:15,y:20,width:width - 30,height:20));
        titleLabel.font = UIFont.kTitleFont();
        titleLabel.textAlignment = NSTextAlignment.center;
        titleLabel.textColor = UIColor.black;
        titleLabel.text = dic.value(forKey: "title") as?String;
        scrollView.addSubview(titleLabel);
        
        let dateLabel = UILabel.init(frame: CGRect(x:100,y:titleLabel.frame.maxY + 20,width:150,height:15));
        dateLabel.text = dic.value(forKey: "date") as?String;
        dateLabel.textColor = UIColor.lightGray;
        scrollView.addSubview(dateLabel);
        dateLabel .sizeToFit();
        
        let dateLabelWidth = dateLabel.frame.size.width;
        
        dateLabel.frame = CGRect(x:(width - dateLabelWidth - 20) / 2 + 20,y:titleLabel.frame.maxY + 20,width:dateLabelWidth,height:15);
        
        let imageView = UIImageView.init(frame: CGRect(x:(width - dateLabelWidth - 20) / 2,y:titleLabel.frame.maxY + 20,width:15,height:15))
        imageView.image = UIImage.init(named: "clock");
        scrollView .addSubview(imageView);
        
        
        let lineView = UIView.init(frame: CGRect(x:15,y:imageView.frame.maxY + 20,width:width - 30,height:0.4))
        lineView.backgroundColor = UIColor.lightGray;
        scrollView .addSubview(lineView);
        
        
        let context = dic.value(forKey: "context") as?String;
        let contextHeight = getTextHeigh(textStr:context!, font: UIFont.kNormalFont(), width: width - 30);
        
        
        
        let contextLabel = UILabel.init(frame: CGRect(x:15,y:lineView.frame.maxY + 20,width:width - 30,height:contextHeight));
        contextLabel.font = UIFont.kNormalFont();
        contextLabel.numberOfLines = 0;
        contextLabel.text = context;
        contextLabel.textColor = UIColor.lightGray;
        scrollView.addSubview(contextLabel);
        
        let fromLabel = UILabel.init(frame: CGRect(x:15,y:contextLabel.frame.maxY + 20,width:width - 30,height:15));
        fromLabel.font = UIFont.kNormalFont();
        fromLabel.textAlignment = NSTextAlignment.right;
        fromLabel.textColor = UIColor.lightGray;
        fromLabel.text = "京县理财管理团队";
        scrollView.addSubview(fromLabel);
        
        scrollView.frame = CGRect(x:0,y:0,width:width,height:fromLabel.frame.maxY + 20 + 64);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
}
