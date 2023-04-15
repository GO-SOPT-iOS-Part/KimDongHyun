//
//  ViewController.swift
//  SeminarWeek2_example
//
//  Created by 김동현 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

final class FirstViewController: UIViewController {
    
    var count: Int = 0
    
    private lazy var countLabel = UILabel().then {
        $0.clipsToBounds = true
        $0.text = "안녕🐥 버튼을 눌러봐"
        $0.font = .systemFont(ofSize: 25)
        $0.backgroundColor = .systemGray6
        $0.textColor = .systemTeal
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    
    private lazy var resultButton = UIButton().then {
        $0.setTitle("다음으로!!", for: .normal)
        $0.backgroundColor = .systemTeal
        $0.titleLabel?.font = .boldSystemFont(ofSize: 22)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    @objc
    func resultButtonTapped() {
        let nextViewController = NextViewController()
        nextViewController.delegate = self
        self.present(nextViewController, animated: true)
    }
}


private extension FirstViewController{
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        view.addSubview(countLabel)
        view.addSubview(resultButton)
        
        countLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(100)
        }
        
        resultButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(500)
            make.leading.equalToSuperview().offset(140)
            make.trailing.equalToSuperview().offset(-140)
            make.height.equalTo(60)
        }
    }
    
    
}

extension FirstViewController: CountNumberDelegate{
    func countNumber() {
        count += 1
        if count <= 5 {
            countLabel.text = "조금만 더 눌러바..🥹"
        }
        else if count > 5 && count<=10 {
            countLabel.text = "쉿 \(count)밖에 안눌렀구나?"
        }
        else if count > 10 {
            countLabel.text = "오! 쉿 \(count)만큼이나 눌렀어?"
        }

    }
    
    func deleteNumber() {
        count -= 1
        if count <= 5 {
            countLabel.text = "조금만 더 눌러바..🥹"
        }
        else if count > 5 && count<=10 {
            countLabel.text = "쉿 \(count)밖에 안눌렀구나?"
        }
        else if count > 10 {
            countLabel.text = "오! 쉿 \(count)만큼이나 눌렀어?"
        }
        
    }
}


