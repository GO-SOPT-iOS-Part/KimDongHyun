//
//  MoveViewController.swift
//  SeminarWeek1
//
//  Created by 김동현 on 2023/04/01.
//

import UIKit

final class SecondViewController_1st_Seminar: UIViewController {        // 두 번째 뷰 컨트롤러인 SecondViewController_1st_Seminar 클래스를 정의하는 코드이다.
    
    
    
    private let nameLabel: UILabel = {              //  클로저를 이용하여 UILabel을 생성하고, 이를 nameLabel 상수에 할당
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label                                // 생성된 객체를 반환
    }()
    
    
    private lazy var backButton: UIButton = {       // lazy 키워드로 선언되어 있기 때문에, 해당 뷰컨트롤러 객체가 로드될 때까지 초기화를 지연시키는 특징이 있다.
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        // button.addTarget을 통해 버튼을 누르면 backButtonTapped() 메소드가 호출되도록 한다.
        return button
    }()
    
    
    override func viewDidLoad() {                   // viewDidLoad() 메서드는 해당 UIViewController 인스턴스의 뷰가 메모리에 로드된 직후에 호출되는 메서드이다.
        // style(), setLayout(), dataBind() 메서드를 호출한다.
        super.viewDidLoad()
        
        style()
        setLayout()
        dataBind()
    }
    
    
    @objc                                            // 뷰컨 위에 새로운 뷰가??
    func backButtonTapped() {
        
        if self.navigationController == nil {        // ViewController가 navigationController를 가지고 있는 경우 navigationController를 통해 이전 ViewController로 이동한다.
            self.dismiss(animated: true, completion: nil)
        } else {                                     // 그렇지 않은 경우(dismiss 방식으로 뷰컨을 띄운 경우) 현재 ViewController를 dismiss하여 화면에서 제거한다.
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func dataBind(name: String) {       // 값을 입력받는 부분 (이름을 받아서 name 속성에 저장)
        self.name = name
    }
    var name: String?
    func dataBind() {
        nameLabel.text = name
    }
}

private extension SecondViewController_1st_Seminar {                    // 뷰의 스타일을 지정하고 뷰 구성을 설정하는 데 필요한 함수들이 있는 부분.
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}
