//
//  UIButton+.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/14.
//

import UIKit

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
           let minimumSize: CGSize = CGSize(width: 1.0, height: 1.0)
           UIGraphicsBeginImageContext(minimumSize)
           
           if let context = UIGraphicsGetCurrentContext() {
               context.setFillColor(color.cgColor)
               context.fill(CGRect(origin: .zero, size: minimumSize))
           }
           
           let colorImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
           
           self.clipsToBounds = true
           self.setBackgroundImage(colorImage, for: state)
       }
    
    
}

