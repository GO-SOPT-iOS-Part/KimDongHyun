//
//  CommonView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/22.
//
import UIKit

import SnapKit
import Then

final class HelloView: UIView {
    
    
    let tvingImageView = UIImageView(image: UIImage(named: "tvingImage"))
    
    var emailLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .tvingGray1
    }
    
    let welcomeLabel = UILabel().then {
        $0.text = "반가워요!"
        $0.textAlignment = .center
        $0.font = .tvingBold(ofSize: 23)
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .tvingGray1
    }
    
    lazy var goMainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.backgroundColor = UIColor(named: "red")
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.titleLabel?.textColor = UIColor .white
        $0.layer.cornerRadius = 3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("HelloView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .black
    }
    private func setLayout() {
        self.addSubviews(tvingImageView,emailLabel,welcomeLabel,goMainButton)
        
        tvingImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(210.94)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67.06)
            $0.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImageView.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
        
        goMainButton.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(384)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

}
