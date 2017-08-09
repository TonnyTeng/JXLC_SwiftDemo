//
//  FindPassWordCell.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/8.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class FindPassWordCell: UITableViewCell {

    var titleLabel = UILabel()
    var textField = UITextField()
    var subButton = UIButton()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        titleLabel = UILabel.init(frame: CGRect(x:15,y:10,width:100,height:30))
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.kNormalFont()
        self.contentView.addSubview(titleLabel)
        
        textField = UITextField.init(frame: CGRect(x:80,y:10,width:width - 130 - 10,height:30))
        textField.textColor = UIColor.black
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        textField.font = UIFont.kNormalFont()
        self.contentView.addSubview(textField)
        
        subButton = UIButton.init(frame: CGRect(x:width - 125,y:10,width:110,height:30))
        subButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        subButton.setTitle("获取验证码", for: UIControlState.normal);
        subButton.titleLabel?.font = UIFont.kTitleFont()
        subButton.layer.cornerRadius = 4.0;
        subButton.backgroundColor = UIColor.kMainBlueColor();
        self.contentView.addSubview(subButton)
        
    }

    func config(model:NSDictionary){
        
        titleLabel.text = model["title"] as? String;//向下转型不确定成功：as?String  向下转型确定成功：as!String
        textField.placeholder = model["text"] as? String;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
