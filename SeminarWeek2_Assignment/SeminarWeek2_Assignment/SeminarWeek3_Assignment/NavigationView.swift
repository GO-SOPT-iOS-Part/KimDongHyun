//
//  NavigationBarView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class NavigationView: UIView {
    
    let backButton = UIButton().then {
        $0.setImage(UIImage.Image.backButton, for: .normal)
        $0.isSelected = true
        $0.backgroundColor = .tvingBlack
    }
    
    let alarmButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bell"), for: .normal)
        $0.tintColor = UIColor.tvingGray2
        $0.backgroundColor = .tvingBlack
    }
    
    let settingButton = UIButton().then {
        $0.setImage(UIImage(systemName: "gearshape"), for: .normal)
        $0.tintColor = UIColor.tvingGray2
        $0.backgroundColor = .tvingBlack
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("NavigationBarView Error")
    }
    private func setStyle() {
        self.backgroundColor = .tvingBlack
    }
    private func setLayout() {
        self.addSubviews(backButton,alarmButton,settingButton)
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().offset(-25)
            $0.width.equalTo(30)
        }
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalTo(settingButton.snp.leading).offset(-20)
            $0.bottom.equalToSuperview().inset(25)
            $0.width.equalTo(30)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalToSuperview().inset(25)
            $0.width.equalTo(30)
        }
    }
}
