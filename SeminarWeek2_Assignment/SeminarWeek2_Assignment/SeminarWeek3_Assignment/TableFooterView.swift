//
//  TableFooterView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/29.
//

import UIKit

import SnapKit
import Then

final class TableFooterView: UIView {
    
    let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.backgroundColor = .tvingBlack
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor(named: "gray4")?.cgColor
        $0.layer.cornerRadius = 4
       // $0.contentEdgeInsets = UIEdgeInsets(top: 17, left: 153, bottom: 17, right: 11)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.setTitleColor(.tvingGray2, for: .normal)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("FooterView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .tvingBlack
    }
    private func setLayout() {
        self.addSubview(logoutButton)
        logoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(22)
        }
    }
}
