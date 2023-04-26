//
//  ProfileTableViewCell.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"
    

    
    private lazy var nextButton = UIButton()
    private lazy var titleLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        setStyle()
//        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
