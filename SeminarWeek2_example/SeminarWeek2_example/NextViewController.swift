//
//  NextViewController.swift
//  SeminarWeek2_example
//
//  Created by 김동현 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

protocol CountNumberDelegate: AnyObject {
    func countNumber()
    func deleteNumber()
}


final class NextViewController: UIViewController {
    
    weak var delegate: CountNumberDelegate?
    
    
    private lazy var countLabel = UILabel().then {
        $0.clipsToBounds = true
        $0.text = "몇번 눌렀는지 궁금해 ?!"
        $0.font = .systemFont(ofSize: 20)
        $0.backgroundColor = .systemGray6
        $0.textColor = .systemTeal
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    
    private lazy var countButton = UIButton().then {
        $0.setTitle("누르쉿 ?", for: .normal)
        $0.backgroundColor = .systemTeal
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 10
        $0.addTarget(self,
                     action: #selector(countButtonTapped), for: .touchUpInside)
    }
    
    private lazy var deleteButton = UIButton().then {
        $0.setTitle("취소하쉿 ?", for: .normal)
        $0.backgroundColor = .systemTeal
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 10
        $0.addTarget(self,
                     action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("뒤로가쉿 ?", for: .normal)
        $0.backgroundColor = .systemTeal
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
    }
}

extension NextViewController{
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubview(countLabel)
        view.addSubview(countButton)
        view.addSubview(deleteButton)
        view.addSubview(backButton)
        
        countLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(80)
        }
        
        countButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(50)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(countButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(deleteButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func countButtonTapped() {
        delegate?.countNumber()
    }
    
    @objc
    private func deleteButtonTapped() {
        delegate?.deleteNumber()
    }
    
    @objc
    private func backButtonTapped() {
        self.dismiss(animated: true)
        
    }
}
