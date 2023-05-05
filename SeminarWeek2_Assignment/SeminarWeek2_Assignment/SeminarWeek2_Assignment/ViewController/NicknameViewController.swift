//
//  NicknameViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/14.
//
import UIKit

import SnapKit


final class NicknamViewController: BaseViewController {
    
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .tvingBlack
        label.font = .tvingMedium(ofSize: 23)
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .tvingGray4
        textField.backgroundColor = .tvingGray2
        textField.layer.cornerRadius = 3
        textField.font = .tvingSemiBold(ofSize: 14)
        textField.setLeftPadding(amount: 22)
        textField.attributedPlaceholder = NSAttributedString(
            string: "아요왕이 될 김동현",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.tvingGray1]
        )
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.backgroundColor = .tvingRed
        button.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        button.titleLabel?.textColor = .tvingWhite
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        setView()
        
    }
    func setView() {
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    override func setStyle() {          // override 키워드를 붙여주어야 함.
        view.backgroundColor = .tvingWhite
    }
    
    override func setLayout() {
        view.addSubviews(nicknameLabel,nicknameTextField,saveButton)
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(25)
            make.width.equalTo(250)
            make.height.equalTo(27)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(21)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(214.19)
            make.centerX.equalToSuperview()
            make.width.equalTo(332.34)
            make.height.equalTo(52)
        }
    }
}
    extension NicknamViewController {
    
        func presentToStartViewController() {
            let startViewController = StartViewController()
            startViewController.modalPresentationStyle = .fullScreen
            self.present(startViewController, animated: true)
        }
        
        @objc
        func saveButtonTapped() {
            self.dismiss(animated: true)
        }
    }
    

