//
//  StartView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class StartView: UIView {
    
    lazy var backButton = UIButton().then {
        $0.setImage(UIImage.Image.backButton, for: .normal)
        $0.isSelected = true
    }
    
    lazy var textFieldClearButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle.svg"), for: .normal)
        button.setImage(UIImage.Image.cancle, for: .normal)
        button.isHidden = true
        return button
    }()
    
    lazy var textFieldClearButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.Image.cancle, for: .normal)
        button.isHidden = true
        return button
    }()
    
    lazy var textFieldHideButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.Image.textFieldClear, for: .normal)
        button.isHidden = true
        return button
    }()
    
    lazy var idFindButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        button.titleLabel?.textColor = .tvingGray2
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var passwordFindButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        button.titleLabel?.textColor = .tvingGray2
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.tvingGray2, for: .disabled)
        button.setTitleColor(.tvingWhite, for: .normal)
        button.setBackgroundColor(.tvingBlack, for: .disabled)
        button.setBackgroundColor(.tvingRed, for: .normal)
        button.isEnabled = false
        button.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "gray4")?.cgColor
        return button
    }()
    
    lazy var nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setUnderline()
        button.backgroundColor = .black
        button.titleLabel?.font = .tvingRegular(ofSize: 14)
        button.titleLabel?.textColor = .tvingGray2
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .tvingGray2
        textField.backgroundColor = .tivingGray4
        textField.layer.cornerRadius = 3
        textField.font = .tvingSemiBold(ofSize: 15)
        textField.setLeftPadding(amount: 22)
        textField.setRightPadding(amount: 90)
        textField.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "tvingGray2") ?? .gray]
        )
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textContentType = .newPassword
        textField.isSecureTextEntry = true
        textField.textColor = .tvingGray2
        textField.backgroundColor = .tivingGray4
        textField.layer.cornerRadius = 3
        textField.font = .tvingSemiBold(ofSize: 15)
        textField.setLeftPadding(amount: 22)
        textField.setRightPadding(amount: 90)
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "tvingGray2") ?? .gray])
        return textField
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textAlignment = .center
        label.textColor = .tvingGray1
        label.font = .tvingMedium(ofSize: 23)
        return label
    }()
    
    let idtextLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textAlignment = .center
        label.font = .tvingSemiBold(ofSize: 14)
        label.textColor = .tvingGray3
        return label
    }()
    
    let midLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textAlignment = .center
        label.textColor = .tivingGray4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setstyle()
        setlayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("StartView Error!")
    }
    
    private func setstyle() {
        self.backgroundColor = .black
    }
    private func setlayout() {
        self.addSubviews(backButton,loginLabel,idTextField,passwordTextField,loginButton,idFindButton,
                         passwordFindButton,idtextLabel,nicknameButton,midLabel)
        idTextField.addSubview(textFieldClearButton1)
        passwordTextField.addSubviews(textFieldHideButton,textFieldClearButton2)
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(65)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(8)
            make.height.equalTo(15)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(31)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(290)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        idFindButton.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(373)
            make.trailing.equalTo(midLabel.snp.leading).offset(-33)
            make.width.equalTo(80)
            make.height.equalTo(22)
        }
        
        midLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(378)
            make.centerX.equalToSuperview()
        }
        
        passwordFindButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(373)
            make.leading.equalTo(midLabel.snp.trailing).offset(33)
            make.width.equalTo(80)
            make.height.equalTo(22)
        }
        
        idtextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(423)
            make.leading.equalToSuperview().inset(51)
            make.trailing.equalToSuperview().inset(195)
            make.width.equalTo(180)
            make.height.equalTo(22)
        }
        
        nicknameButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(423)
            make.leading.equalToSuperview().inset(197)
            make.trailing.equalToSuperview().inset(50)
            make.width.equalTo(128)
            make.height.equalTo(22)
        }
        
        textFieldHideButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        textFieldClearButton1.snp.makeConstraints { make in
            make.centerY.equalTo(idTextField.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        textFieldClearButton2.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalTo(textFieldHideButton.snp.leading).offset(-16)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
}
