//
//  UITextField+.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/14.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    class var tvingRed: UIColor {
        return UIColor(r: 255, g: 20, b: 60)
    }

    class var tvingBlack: UIColor {
        return UIColor(r: 0, g: 0, b: 0)
    }
    
    class var tvingWhite: UIColor {
        return UIColor(r: 255, g: 255, b: 255)
    }
    
    class var tvingGray1: UIColor {
        return UIColor(r: 214, g: 214, b: 214)
    }
    
    class var tvingGray2: UIColor {
        return UIColor(r: 156, g: 156, b: 156)
    }
    
    class var tvingGray3: UIColor {
        return UIColor(r: 98, g: 98, b: 98)
    }
    
    class var tivingGray4: UIColor {
        return UIColor(r: 46, g: 46, b: 46)
    }
    
    class var tivingGray5: UIColor {
        return UIColor(r: 25, g: 25, b: 25)
    }


      
}
