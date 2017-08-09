//
//  ActivityListCell.swift
//  JXLiCai
//
//  Created by dengtao on 2017/7/7.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class ActivityListCell: UITableViewCell {

    var typeImageView   = UIImageView()//类型 火热推荐
    var adImageView     = UIImageView()//广告
    var statusImageView = UIImageView()//状态
    var timeImageView   = UIImageView()//时间
    var moreImageView   = UIImageView()//更多
    
    
    
    var typeLabel       = UILabel()
    var statusLabel     = UILabel()
    var titleLabel      = UILabel()
    var detailLabel     = UILabel()
    var timeLabel       = UILabel()
    
    var lineView        = UIView()
    var whiteView       = UIView()
    
    var widthCell:CGFloat = 0.0
    var heightCell:CGFloat = 0.0
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor .groupTableViewBackground
        
//        widthCell = self.frame.size.width
//        heightCell = self.frame.size.height
        
        
        whiteView = UIView.init(frame: CGRect(x:0,y:10,width:width,height:185 + width / 3))
        whiteView.backgroundColor = UIColor.white
        self.contentView .addSubview(whiteView)
        
        typeImageView = UIImageView.init(frame: CGRect(x:15,y:15,width:16,height:15))
        typeImageView.image = UIImage(named:"hot_icon")
        whiteView .addSubview(typeImageView)
        
        typeLabel = UILabel.init(frame: CGRect(x:45,y:15,width:width - 60,height:15))
        typeLabel.textColor = UIColor.black
        typeLabel.font = UIFont.kFont(x: 15)
        whiteView .addSubview(typeLabel)
        
        let heightAdImage = width / 3
        
        adImageView = UIImageView.init(frame: CGRect(x:0,y:typeLabel.frame.maxY + 15 ,width:width,height:heightAdImage))
        adImageView.image = UIImage(named:"adImage")
        whiteView .addSubview(adImageView)
        
        statusImageView = UIImageView.init(frame: CGRect(x:0,y:0,width:100,height:27))
        statusImageView.image = UIImage(named:"activity-advance")
        adImageView .addSubview(statusImageView)
        
        statusLabel = UILabel.init(frame: CGRect(x:15,y:6,width:70,height:15))
        statusLabel.textColor = UIColor.white
        statusLabel.font = UIFont.kFont(x: 15)
        statusImageView .addSubview(statusLabel)
       
        
        titleLabel = UILabel.init(frame: CGRect(x:15,y:adImageView.frame.maxY + 15,width:width - 30,height:20))
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.kTitleFont()
        whiteView .addSubview(titleLabel)
        
        detailLabel = UILabel.init(frame: CGRect(x:15,y:titleLabel.frame.maxY + 5,width:width - 30,height:40))
        detailLabel.textColor = UIColor.black
        detailLabel.font = UIFont.kNormalFont()
        detailLabel.numberOfLines = 0
        whiteView .addSubview(detailLabel)
        
        
        lineView = UIView.init(frame: CGRect(x:10,y:detailLabel.frame.maxY + 15,width:width - 30,height:0.4))
        lineView.backgroundColor = UIColor.gray
        whiteView .addSubview(lineView)
        
        timeImageView = UIImageView.init(frame: CGRect(x:15,y:lineView.frame.maxY + 15,width:15,height:15))
        timeImageView.image = UIImage(named:"clock")
        whiteView .addSubview(timeImageView)
        
        timeLabel = UILabel.init(frame: CGRect(x:45,y:lineView.frame.maxY + 15,width:width - 80,height:15))
        timeLabel.textColor = UIColor.gray
        timeLabel.font = UIFont.kNormalFont()
        whiteView .addSubview(timeLabel)
        
        moreImageView = UIImageView.init(frame: CGRect(x:width - 15 - 8,y:lineView.frame.maxY + 15,width:8,height:15))
        moreImageView.image = UIImage(named:"more")
        whiteView .addSubview(moreImageView)
        
    }
    
    func configDataWithModel(model:NSDictionary){
        
    
        let isEnd:Int = Int(arc4random() % 2)
        
        
        if isEnd == 3 {
            //活动结束
            statusImageView.image = UIImage(named:"activity_end")
            statusLabel.text = "已经结束"
            
        }else{
        
            //活动进行中
            typeLabel.text = "火热推荐"
            statusImageView.image = UIImage(named:"activity-advance")
            statusLabel.text = "正在进行"
        }
        titleLabel.text = "国庆长假福利|领红包，抽iPhone7"
        let detailTitle =  "国庆长假福利|领红包，抽iPhone7,国庆长假福利|领红包，抽iPhone7,国庆长假福利|领红包，抽iPhone7,国庆长假福利|领红包，抽iPhone7,国庆长假福利|领红包，抽iPhone7,"
        detailLabel.text = detailTitle
        timeLabel.text = "2017-07-07"
        
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
