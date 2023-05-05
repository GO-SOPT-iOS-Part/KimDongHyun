//
//  UIFont+.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/24.
//

import UIKit

extension UIFont {
    
    class func tvingBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
    
    class func tvingSemiBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
    
    class func tvingMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: size)!
    }
    
    class func tvingRegular(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Regular", size: size)!
    }
}
