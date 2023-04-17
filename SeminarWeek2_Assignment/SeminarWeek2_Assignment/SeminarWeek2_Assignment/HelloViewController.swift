//
//  HelloViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/12.
//

import UIKit

import SnapKit


final class HelloViewController: UIViewController {

    private lazy var email = "skydh1214@naver.com"

    private lazy var tvingImageView: UIImageView = {
        let welcomeImageView = UIImageView()
        welcomeImageView.backgroundColor = .black
        welcomeImageView.image = UIImage(named: "tvingimage")
        return welcomeImageView
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "\(String(describing: email))님"
        label.textAlignment = .center
        label.font = UIFont(name:"Pretendard-Bold", size: 23)
        label.textColor = .tvingGray1
        return label
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "반가워요!"
        label.textAlignment = .center
        label.font = UIFont(name:"Pretendard-Bold", size: 23)
        label.textColor = .tvingGray1
        return label
    }()
    
    private lazy var goMainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = UIColor(named: "red")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.textColor = UIColor .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(goMainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}


// MARK: - HelloViewController 관련 속성(배경 및 레이아웃)
extension HelloViewController {
    private func setStyle() {
        view.backgroundColor = .black
    }
    private func setLayout() {
        view.addSubviews(tvingImageView,emailLabel,welcomeLabel,goMainButton)
        
        tvingImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(58)
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(375)
            make.height.equalTo(210.94)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(tvingImageView.snp.bottom).offset(67.06)
            make.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(tvingImageView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        
        goMainButton.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(284)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
    }
    
    func backToStartViewController() {
        let startViewController = StartViewController()
       startViewController.modalPresentationStyle = .fullScreen
        self.present(startViewController, animated: true)
    }
    
    @objc
    func goMainButtonTapped() {
        backToStartViewController()
    }
}

