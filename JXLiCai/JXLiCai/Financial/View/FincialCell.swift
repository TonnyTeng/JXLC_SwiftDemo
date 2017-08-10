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
    
    // Xib 初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.backgroundColor = UIColor.redColor;
        self.blueLabel.layer.cornerRadius = 4.0;
        self.blueLabel.layer.masksToBounds = true;
        
        self.redLabel.layer.cornerRadius = 4.0;
        self.redLabel.layer.masksToBounds = true;
        
        self.progressLabel.layer.cornerRadius = self.progressLabel.frame.size.width / 2;
        self.progressLabel.layer.borderColor = UIColor.orange.cgColor;
        self.progressLabel.layer.borderWidth = 3;
        self.progressLabel.layer.masksToBounds = true;
        
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
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
