//
//  Extensions.swift
//  JXLiCai
//
//  Created by dengtao on 2017/8/9.
//  Copyright © 2017年 JingXian. All rights reserved.
//

import UIKit

class Extensions: NSObject {

    
}


extension UIColor{

    class func kRGBColor(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
        
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1);
    }
    
    class func kRGBAColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
        
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a);
    }
    
    class func kMainBlueColor() -> UIColor {
        
        return UIColor.init(red: 30/255.0, green: 144/255.0, blue: 255/255.0, alpha: 1);
    }
    
}

extension UIFont{

    class func kBFont(x:CGFloat) -> UIFont {
        
        return UIFont.boldSystemFont(ofSize:CGFloat(x));
    }
    
    class func kFont(x:CGFloat) -> UIFont {
        
        return UIFont.systemFont(ofSize: CGFloat(x));
    }
   
    class func kTitleFont() -> UIFont {
        
        return UIFont.systemFont(ofSize:16);
    }
    
    class func kNormalFont() -> UIFont {
        
        return UIFont.systemFont(ofSize:14);
    }
    
    class func kSmallFont() -> UIFont {
        
        return UIFont.systemFont(ofSize: 12);
    }
    
}
//
//extension UIViewController{
//
//    class func kWidth() ->CGFloat {
//        
//        return UIScreen.main.bounds.size.width;
//    }
//   
//    class func kHeight() ->CGFloat {
//        
//        return UIScreen.main.bounds.size.height;
//    }
//}
