//
//  UIColor-Extension.swift
//  StudyDYZB
//
//  Created by yyk on 2018/12/17.
//  Copyright © 2018 yyk. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha:1.0)
    }
}
