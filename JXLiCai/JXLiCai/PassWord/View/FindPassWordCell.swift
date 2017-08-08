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
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(titleLabel)
        
        textField = UITextField.init(frame: CGRect(x:130,y:10,width:width - 130 - 120,height:30))
        textField.textColor = UIColor.black
        textField.clearButtonMode = UITextFieldViewMode.whileEditing;
        textField.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(textField)
        
        subButton = UIButton.init(frame: CGRect(x:width - 125,y:10,width:110,height:30))
        subButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        subButton.setTitle("获取验证码", for: UIControlState.normal);
        subButton.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        subButton.layer.cornerRadius = 4.0;
        subButton.backgroundColor = UIColor.init(red: 30/255.0, green: 144/255.0, blue: 255/255.0, alpha: 1);
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
