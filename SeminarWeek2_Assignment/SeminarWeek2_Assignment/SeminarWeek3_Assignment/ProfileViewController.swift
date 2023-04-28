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
    
    //MARK: - Properties
    private let originView = ProfileTableHeaderView()
    override func loadView() {
        self.view = originView
        
        func viewDidLoad() {
            super.viewDidLoad()
        }
    }
}

