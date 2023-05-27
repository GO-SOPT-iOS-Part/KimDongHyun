//
//  SignUpViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/06.
//

import UIKit

final class SignViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "skydh1214@naver.com",
                                    nickname: "brick",
                                    password: "skydh1214!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
