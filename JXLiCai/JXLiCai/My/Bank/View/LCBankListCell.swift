//
//  LCBankListCell.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/19.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCBankListCell: UITableViewCell {

    var logoImageView = UIImageView()
    var bankNameLabel = UILabel()
    var bankTypeLabel = UILabel()
    var bankNumLabel  = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.backgroundColor = UIColor.groupTableViewBackground;
        
        let view = UIView.init(frame: CGRect(x:15,y:5,width:width - 30,height:self.frame.size.height - 10));
        view.backgroundColor = UIColor.white;
        view.layer.cornerRadius = 4;
        self.contentView.addSubview(view);
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
