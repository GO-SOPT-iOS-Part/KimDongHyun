//
//  SettingTableViewCell.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/26.
//
import UIKit

import SnapKit
import Then


class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    let titleLabel = UILabel()
    let nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
                setStyle()
                setHierarchy()
                setLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension SettingTableViewCell {
    func setStyle() {
        selectionStyle = .none
        
        titleLabel.do {
            $0.font = .tvingMedium(ofSize: 15)
            $0.textColor = .tvingGray2
        }
        
        nextButton.do {
            $0.setImage(UIImage.Image.nextImage, for: .normal)
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(titleLabel,nextButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.centerY.equalToSuperview()
        }
        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
    }
    func configureCell(_ setting: BasicSetting) {
        titleLabel.text = setting.titleLabel
    }
}


