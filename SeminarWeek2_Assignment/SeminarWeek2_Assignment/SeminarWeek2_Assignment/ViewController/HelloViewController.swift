//
//  HelloViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/12.
//

import UIKit

import SnapKit

class HelloViewController: BaseViewController {

    private let originView = HelloView()
       
    override func loadView() {
        self.view = originView
    }
        
    var email = " " {
        didSet {
            originView.emailLabel.text = email + "님"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
    }
    
    func setTarget() {
        originView.goMainButton.addTarget(self, action: #selector(goMainButtonTapped), for: .touchUpInside)
    }
}

// MARK: - HelloViewController 관련 속성(배경 및 레이아웃)
extension HelloViewController {
    
    func backToStartViewController() {
        dismiss(animated: true)
    }
    
    @objc
    func goMainButtonTapped() {
        backToStartViewController()
    }
}

