//
//  boundryLineView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/29.
//

import UIKit

import SnapKit
import Then

final class boundryLineView: UITableViewHeaderFooterView {
    
    let boundryline = UIView().then {
        $0.backgroundColor = UIColor(named: "tvingRed")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("boundryLineView Error!")
    }
    private func setLayout() {
        self.addSubview(boundryline)
        boundryline.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(1)
        }
        
    }
}
