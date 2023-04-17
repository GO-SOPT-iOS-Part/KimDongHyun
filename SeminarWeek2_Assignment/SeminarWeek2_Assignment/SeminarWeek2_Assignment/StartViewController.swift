//
//  StartViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/11.
//

import UIKit

import SnapKit


final class StartViewController: UIViewController {
    
    // MARK: - UI 속성 정리
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_before.svg"), for: .normal)
        button.isSelected = true
        return button
    }()
    
    lazy var cancleButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle.svg"), for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(cancleButton1Tapped), for: .touchUpInside)
        return button
    }()
    
    lazy var cancleButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancle.svg"), for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(cancleButton2Tapped), for: .touchUpInside)
        return button
    }()
    
    lazy var eyeslashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eye-slash.pdf"), for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(eyeslashButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var idFindButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font = UIFont(name:"Pretendard-SemiBold", size: 14)
        button.titleLabel?.textColor = .tvingGray2
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var passwordFindButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.font = UIFont(name:"Pretendard-SemiBold", size: 14)
        button.titleLabel?.textColor = .tvingGray2
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.tvingGray2, for: .disabled)
        button.setTitleColor(.tvingWhite, for: .normal)
        button.setBackgroundColor(.tvingBlack, for: .disabled)
        button.setBackgroundColor(.tvingRed, for: .normal)
        button.isEnabled = false
        button.titleLabel?.font = UIFont(name:"Pretendard-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "gray4")?.cgColor
        button.self.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setUnderline()
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name:"Pretendard-Regular", size: 14)
        button.titleLabel?.textColor = .tvingGray2
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .tvingGray2
        textField.backgroundColor = .tivingGray4
        textField.layer.cornerRadius = 3
        textField.font = UIFont(name:"Pretendard-SemiBold", size: 15)
        textField.setLeftPadding(amount: 22)
        textField.setRightPadding(amount: 90)
        textField.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "tvingGray2") ?? .gray]
        )
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textContentType = .newPassword
        textField.isSecureTextEntry = true
        textField.textColor = .tvingGray2
        textField.backgroundColor = .tivingGray4
        textField.layer.cornerRadius = 3
        textField.font = UIFont(name:"Pretendard-SemiBold", size: 15)
        textField.setLeftPadding(amount: 22)
        textField.setRightPadding(amount: 90)
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "tvingGray2") ?? .gray])
        return textField
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textAlignment = .center
        label.textColor = .tvingGray1
        label.font = UIFont(name:"Pretendard-Medium", size: 23)
        return label
    }()
    
    private let idtextLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textAlignment = .center
        label.font = UIFont(name:"Pretendard-SemiBold", size: 14)
        label.textColor = .tvingGray3
        return label
    }()
    
    private let midLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textAlignment = .center
        label.textColor = .tivingGray4
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setstyle()
        setlayout()
        
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
}

// MARK: - StartViewController 관련 속성 (배경 및 레이아웃)
extension StartViewController {
    private func setstyle() {
        view.backgroundColor = .black
    }
    private func setlayout() {
        view.addSubviews(backButton,loginLabel,idTextField,passwordTextField,loginButton,idFindButton,
                         passwordFindButton,idtextLabel,nicknameButton,midLabel)
        idTextField.addSubview(cancleButton1)
        passwordTextField.addSubviews(eyeslashButton,cancleButton2)
        
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
//            make.width.equalTo(3)
//            make.height.equalTo(12)
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
        
        eyeslashButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        cancleButton1.snp.makeConstraints { make in
            make.centerY.equalTo(idTextField.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        cancleButton2.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.trailing.equalTo(eyeslashButton.snp.leading).offset(-16)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    func presentToHelloViewController() {
        let text = idTextField.text     // HelloViewController에 전달할 내용임. idTextField.text를 새로 만든 변수 text에 넣어준다.
        let helloViewController = HelloViewController()
        helloViewController.emailLabel.text = text  //  helloViewController.emailLabel.text의 내용에 text를 넣는다.
        helloViewController.modalPresentationStyle = .fullScreen
        self.present(helloViewController, animated: true)
    }


    
    // MARK: - Button 관련
    @objc
    func cancleButton1Tapped() {
        
        idTextField.text = ""
    }
    
    @objc
    func cancleButton2Tapped() {
        passwordTextField.text = ""
    }
    
    @objc
    func eyeslashButtonTapped() {
        self.eyeslashButton.isSelected = !self.eyeslashButton.isSelected
        passwordTextField.isSecureTextEntry = self.eyeslashButton.isSelected
    }
    
    @objc
    func loginButtonTapped() {
        presentToHelloViewController()
    }
    
    //    일단 이거 남겨두고.. 다시 돌릴 내영임
//    @objc
//    func nicknameButtonTapped() {
//        presentToNicknamViewController()
//    }
    
    @objc
    func nicknameButtonTapped() {
        let modal = NicknamViewController()
        if let sheet = modal.sheetPresentationController{
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            //sheet.delegate = self
        }
       self.present(modal, animated: true)
    }
    
}



// MARK: - Extension 관련
extension StartViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
        if textField == idTextField{
            self.cancleButton1.isHidden = idTextField.isEmpty
        }
        else {
            self.cancleButton2.isHidden = passwordTextField.isEmpty
            self.eyeslashButton.isHidden = passwordTextField.isEmpty
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "gray4")?.cgColor
        self.cancleButton1.isHidden = true
        self.eyeslashButton.isHidden = true
        self.cancleButton2.isHidden = true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == idTextField{
            self.cancleButton1.isHidden = idTextField.isEmpty
        }
        else {
            self.cancleButton2.isHidden = passwordTextField.isEmpty
            self.eyeslashButton.isHidden = passwordTextField.isEmpty
        }
        guard let id = idTextField.text else { return } // 한번 이메일이 있나?? 검증하고 유효한 이메일 형식인지 체크할께요~!
        self.loginButton.isEnabled = !idTextField.isEmpty && !passwordTextField.isEmpty && id.isValidEmail()
    }
}

//닉네임때 쓸 코드입니다
//extension StartViewController: EmailDelegate{
//    func emailDelegate(email: String){
////        idTextField.text = email
//    }
//}







//name: Pretendard-Regular
//name: Pretendard-Medium
//name: Pretendard-SemiBold
//name: Pretendard-Bold
