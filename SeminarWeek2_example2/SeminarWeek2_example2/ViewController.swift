//
//  ViewController.swift
//  SeminarWeek2_example2
//
//  Created by 김동현 on 2023/04/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private enum Fixture {
        static let halfwidth = UIScreen.main.bounds.width / 2
        static let full = 1.0
        static let quarterheight = UIScreen.main.bounds.height / (4 * full)
    }
    
    private let firstimage = UIView()
    private let secondimage = UIView()
    private let thirdimage = UIView()
    private let fourthimage = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .white
        
        firstimage.backgroundColor = .blue
        secondimage.backgroundColor = .green
        thirdimage.backgroundColor = .orange
        fourthimage.backgroundColor = .yellow
    }
    
    private func layout() {
        view.addSubview(firstimage)
        view.addSubview(secondimage)
        view.addSubview(thirdimage)
        view.addSubview(fourthimage)
        
        firstimage.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaInsets)
            make.leading.equalToSuperview()
            make.width.equalTo(Fixture.halfwidth)
            make.height.equalTo(Fixture.quarterheight)
        }
        
        secondimage.snp.makeConstraints{ make in
            make.top.equalTo(firstimage.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo(Fixture.halfwidth)
            make.height.equalTo(Fixture.quarterheight)
        }
        
        thirdimage.snp.makeConstraints{ make in
            make.top.equalTo(secondimage.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalTo(Fixture.halfwidth)
            make.height.equalTo(Fixture.quarterheight)
        }
        
        fourthimage.snp.makeConstraints{ make in
            make.top.equalTo(thirdimage.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalTo(Fixture.halfwidth)
            make.height.equalTo(Fixture.quarterheight)
        }
    }
}

