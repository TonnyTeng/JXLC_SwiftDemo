//
//  FincialCell.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/10.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class FincialCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!//新手专享|加息券
    @IBOutlet weak var redLabel: UILabel!//限购一次|现金红包
    @IBOutlet weak var yearLabel: UILabel!//年化收益
    @IBOutlet weak var timeLabel: UILabel!//投资期限
    @IBOutlet weak var moneyLabel: UILabel!//起投金额
    @IBOutlet weak var colorLabel: UILabel!
    
    // Xib 初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.backgroundColor = UIColor.redColor;
        self.blueLabel.layer.cornerRadius = 4.0;
        self.blueLabel.layer.masksToBounds = true;
        
        self.redLabel.layer.cornerRadius = 4.0;
        self.redLabel.layer.masksToBounds = true;
        
        self.progressLabel.layer.cornerRadius = self.progressLabel.frame.size.width / 2;
        self.progressLabel.layer.borderColor = UIColor.gray.cgColor;
        self.progressLabel.layer.borderWidth = 3;
        self.progressLabel.layer.masksToBounds = true;
       
        self.colorLabel.layer.cornerRadius = self.progressLabel.frame.size.width / 2;
        self.colorLabel.layer.borderColor = UIColor.orange.cgColor;
        self.colorLabel.layer.borderWidth = 3;
        self.colorLabel.layer.masksToBounds = true;
       
    }

    
    func configData(dic:NSDictionary) {
        
        let progress = arc4random() % 100 + 1;
        if progress >= 50 {
            
            self.colorLabel.isHidden = true;
            self.progressLabel.text = "售馨";
        }else{
            self.colorLabel.isHidden = false;
            self.progressLabel.text = "75%";
        }
    }
    
    // 弧线
    override func draw(_ rect: CGRect) {
       
//        let color = UIColor.orange
//        color.set() // 设置线条颜色
//        let aPath = UIBezierPath(arcCenter: self.colorLabel.center, radius: self.progressLabel.frame.size.width / 2,
//                                 startAngle: 0, endAngle: (CGFloat)(90*3*M_PI/180), clockwise: true)
//        aPath.lineWidth = 3.0 // 线条宽度
//        aPath.stroke() // Draws line 根据坐标点连线，不填充
//        //    aPath.fill() // Draws line 根据坐标点连线，填充
    }
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.blue;
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
       
        // 获取 contentView 所有子控件
        
        // 创建颜色数组
        let colors = NSMutableArray.init();
        // 获取所有子控件颜色
        for view in self.contentView.subviews {
            
            if view.backgroundColor != nil {
                
                 colors .add(view.backgroundColor!);
            }else{
            
                 colors .add(UIColor.clear);
            }
        }
        // 调用super
         super.setSelected(selected, animated: animated)
       
        // 修改控件颜色
        for i in 0..<self.contentView.subviews.count{
        
            self.contentView.subviews[i].backgroundColor = colors[i] as? UIColor;
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
        // 获取 contentView 所有子控件
        
        // 创建颜色数组
        let colors = NSMutableArray.init();
        // 获取所有子控件颜色
        for view in self.contentView.subviews {
            
            if view.backgroundColor != nil {
                
                colors .add(view.backgroundColor!);
            }else{
                
                colors .add(UIColor.clear);
            }
        }
        // 调用super
        super.setHighlighted(highlighted, animated: animated);
        
        // 修改控件颜色
        for i in 0..<self.contentView.subviews.count{
            
            self.contentView.subviews[i].backgroundColor = colors[i] as? UIColor;
        }
    }
}
