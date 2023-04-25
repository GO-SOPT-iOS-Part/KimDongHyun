//
//  StartViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/11.
//

import UIKit

import SnapKit


class StartViewController: BaseViewController {
    
    private let originView = StartView()
    
    override func loadView() {
        self.view = originView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setTarget()
    }
    
    func setDelegate() {
        originView.idTextField.delegate = self
        originView.passwordTextField.delegate = self
    }
    
    func setTarget() {
        originView.textFieldClearButton1.addTarget(self, action: #selector(textFieldClearButton1Tapped), for: .touchUpInside)
        originView.textFieldClearButton2.addTarget(self, action: #selector(textFieldClearButton2Tapped), for: .touchUpInside)
        originView.textFieldHideButton.addTarget(self, action: #selector(textFieldHideButtonTapped(_:)), for: .touchUpInside)
        originView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        originView.nicknameButton.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
    }
    
    func presentToHelloViewController() {
        guard let text = originView.idTextField.text else { return }
        let helloViewController = HelloViewController()
        helloViewController.email = text
        helloViewController.modalPresentationStyle = .fullScreen
        self.present(helloViewController, animated: true)
    }
    
    // MARK: - Button 관련
    @objc
    func textFieldClearButton1Tapped() {
        originView.idTextField.text = ""
    }
    
    @objc
    func textFieldClearButton2Tapped() {
        originView.passwordTextField.text = ""
    }
    
    @objc
    func textFieldHideButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        originView.passwordTextField.isSecureTextEntry = sender.isSelected
    }
    
    @objc
    func loginButtonTapped() {
        presentToHelloViewController()
    }
    
    @objc
    func nicknameButtonTapped() {
        let modal = NicknamViewController()
        if let sheet = modal.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        self.present(modal, animated: true)
    }
    
}

// MARK: - Extension 관련
extension StartViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
        if textField == originView.idTextField{
            originView.textFieldClearButton1.isHidden = originView.idTextField.isEmpty
        }
        else {
            originView.textFieldClearButton2.isHidden = originView.passwordTextField.isEmpty
            originView.textFieldHideButton.isHidden = originView.passwordTextField.isEmpty
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "gray4")?.cgColor
        originView.textFieldClearButton1.isHidden = true
        originView.textFieldHideButton.isHidden = true
        originView.textFieldClearButton2.isHidden = true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == originView.idTextField{
            originView.textFieldClearButton1.isHidden = originView.idTextField.isEmpty
        }
        else {
            originView.textFieldClearButton2.isHidden = originView.passwordTextField.isEmpty
            originView.textFieldHideButton.isHidden = originView.passwordTextField.isEmpty
        }
        guard let id = originView.idTextField.text else { return } // 한번 이메일이 있나?? 검증하고 유효한 이메일 형식인지 체크할께요~!
        self.originView.loginButton.isEnabled = !originView.idTextField.isEmpty && !originView.passwordTextField.isEmpty && id.isValidEmail()
    }
}
