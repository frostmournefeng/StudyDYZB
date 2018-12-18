//
//  UIBarButtonItem-Extension.swift
//  StudyDYZB
//
//  Created by yyk on 2018/12/17.
//  Copyright © 2018 yyk. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //类方法
    /*
    class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
 */
    //构造函数
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero) {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            
         btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            
            btn.sizeToFit()
        } else {
            
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView:btn)
    }
}
