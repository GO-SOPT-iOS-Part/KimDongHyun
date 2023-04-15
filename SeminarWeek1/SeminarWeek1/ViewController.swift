//
//  ViewController.swift
//  SeminarWeek1
//
//  Created by 김동현 on 2023/04/01.
//

import UIKit

final class ViewController: UIViewController {
    // UIViewController 클래스를 상속받아 ViewController 클래스를 정의.
    // final 키워드는 이 클래스가 다른 클래스에서 상속될 수 없음을 나타낸다.
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "솝트에 오신 여러분 환영합니다!"
        return label
    }()
    // UILabel 객체를 생성.
    // UILabel은 텍스트를 표시하는 데 사용되는 iOS 기본 뷰 클래스이다.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    // 뷰 컨트롤러의 뷰가 로드된 직후 호출되는 메서드.
    // setStyle()과 setLayout() 메서드를 호출하여 화면 스타일과 레이아웃을 설정하고 있다.
}


private extension ViewController {
    // ViewController 클래스의 private extension으로,
    // setStyle()과 setLayout() 메서드를 정의하고 있다.
    
    
    func setStyle() {
        
        view.backgroundColor = .white
    }
    // 뷰의 스타일을 설정하는 메서드이다. 현재는 화면의 배경색을 흰색으로 지정하고 있다.
    
    
    func setLayout() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
    }
    // 뷰의 레이아웃을 설정하는 메서드이다. snapkit을 활용하면 간편하다고 한다.
    // 현재는 "NSLayoutConstraint.activate()"를 사용하여 Auto Layout 제약 조건을 활성화한 상태이다.
    
}
