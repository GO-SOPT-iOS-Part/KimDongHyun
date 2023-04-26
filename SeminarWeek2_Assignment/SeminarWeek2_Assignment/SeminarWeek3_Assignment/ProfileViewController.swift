//
//  ProfileViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/26.
//


import UIKit

import SnapKit
import Then

class ProfileViewController: UIViewController {
    
    private let originView = ProfileView()
    override func loadView() {
        self.view = originView
        
        func viewDidLoad() {
            super.viewDidLoad()
        }
    }
}

