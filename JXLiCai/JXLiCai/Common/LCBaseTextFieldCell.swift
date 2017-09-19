//
//  LCBaseTextFieldCell.swift
//  JXLiCai
//
//  Created by dengtao on 2017/9/19.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class LCBaseTextFieldCell: UITableViewCell {

    var titleLabel = UILabel()
    var textField = UITextField()
    var rightButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        titleLabel = UILabel.init(frame: CGRect(x:15,y:self.frame.size.height / 2 - 10,width:100,height:20));
        titleLabel.font = UIFont.kNormalFont();
        self.contentView.addSubview(titleLabel);
        
        textField = UITextField.init(frame: CGRect(x:130,y:self.frame.size.height / 2 - 15,width:width - 145,height:30));
        textField.font = UIFont.kNormalFont();
        self.contentView.addSubview(textField);
        
        rightButton = UIButton.init(frame: CGRect(x:width - 115,y:self.frame.size.height / 2 - 20,width:100,height:40));
        rightButton.isHidden = true;
        self.contentView.addSubview(textField);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
