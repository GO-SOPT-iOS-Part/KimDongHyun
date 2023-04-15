//
//  ExampleViewController.swift
//  SeminarWeek1
//
//  Created by 김동현 on 2023/04/01.
//

import UIKit

class ExampleViewController: UIViewController {
    // UIViewController 클래스를 상속받은 ExampleViewController 클래스가 선언
    // 이 클래스는 화면에 보여지는 요소들을 초기화하고, 레이아웃을 설정하며, 다른 화면으로 전환하는 기능을 담당한다.
    
    
    private let nameLabel: UILabel = {          // 레이블 객체를 생성하고 변수 nameLabel에 할당
        let label = UILabel()                   // UILabel 클래스의 인스턴스를 생성
        label.text = "이름이 무엇인가요!?"           // 레이블 텍스트에 "이름이 무엇인가요!?" 문자열을 할당
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label                            // 생성된 레이블 객체를 반환
    }()                                         // 즉, 이 코드는 이름을 입력받는 레이블의 속성들을 설정하여 nameLabel이라는 변수에 할당하는 것이다.
    
    
    private lazy var presentButton: UIButton = {                  // presentButton 이라는 lazy var 프로퍼티를 정의
        let button = UIButton()                                   // UIButton을 인스턴스화하고, 속성들을 설정한 뒤 button 상수에 할당
        button.setTitle("present!: 밑에서 위로~", for: .normal)      // setTitle 메서드를 사용하여 버튼의 텍스트를 설정하고, 버튼의 텍스트 색상을 파란색으로 설정
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside) // button 연결
        return button                                              // 클로저가 반환하는 button 인스턴스가 presentButton에 할당
    }()                                                            // 뷰 컨트롤러의 뷰가 로드될 때까지 presentButton이 초기화되지 않도록 하기 위해 lazy 키워드를 사용
    
    
    private lazy var pushButton: UIButton = {                       // pushButton 이라는 lazy var 프로퍼티를 정의
        let button = UIButton()                                     // UIButton을 인스턴스화하고, 속성들을 설정한 뒤 button 상수에 할당
        button.setTitle("push!: 옆에서 날아와~", for: .normal)         // setTitle 메서드를 사용하여 버튼의 텍스트를 설정하고, 버튼의 텍스트 색상을 파란색으로 설정
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)    // button 연결
        return button                                               // 클로저가 반환하는 button 인스턴스가 presentButton에 할당
    }()                                                             // 뷰 컨트롤러의 뷰가 로드될 때까지 presentButton이 초기화되지 않도록 하기 위해 lazy 키워드를 사용
    
    
    private let nameTextField: UITextField = {                      // UITextField 인스턴스를 생성하고 속성을 설정하여 nameTextField 상수에 할당하는 코드
        let textField = UITextField()                               // UITextField를 인스턴스화하고, 속성들을 설정한 뒤 textField 상수에 할당
        textField.placeholder = "이름을 입력해주세요"                    // 텍스트 필드 내부에 힌트 텍스트를 표시
        textField.clearButtonMode = .whileEditing                   // 입력한 텍스트를 모두 지움
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField                                            // lazy 키워드를 사용하지 않았기 때문에 nameTextField 상수는 클래스가 인스턴스화될 때 즉시 초기화된다
    }()
    
    
    override func viewDidLoad() {         // viewDidLoad() 함수는 뷰 컨트롤러의 뷰가 메모리에 로드된 직후에 호출되는 함수다.
        super.viewDidLoad()
        
        setLayout()                      // 화면에 띄워야하기 때문에 "setLayout()" 과 "style()"을 불러주어야 한다.
        style()
    }
    
    
    func presentToSecondViewController() {                               // 이 함수는 두 번째 뷰 컨트롤러(SecondViewController_1st_Seminar)로 이동하고,
        let secondViewController = SecondViewController_1st_Seminar()    // 이동하기 전에 현재 뷰 컨트롤러의 nameTextField에서 값을 가져와서 두 번째 뷰 컨트롤러에 전달하는 역할을 한다.
        secondViewController.modalPresentationStyle = .fullScreen
        if let name = nameTextField.text {                               // nameTextField에서 값을 가져와서, 새로운 뷰 컨트롤러의 dataBind() 메서드를 호출하여 값을 전달한다.
            secondViewController.dataBind(name: name)
        }                                                                // present 전에 binding를 통해 값을 전달함
        self.present(secondViewController, animated: true)               // 이후, present() 메서드를 사용하여 새로운 뷰 컨트롤러를 화면에 표시한다. (화면 전환에 사용)
    }
    
    
    func pushToSecondViewController() {                               // pushToSecondViewController() 함수는 SecondViewController_1st_Seminar 클래스의 인스턴스를 만들고,
        let secondViewController = SecondViewController_1st_Seminar()
        if let name = nameTextField.text {
            secondViewController.dataBind(name: name)                 // dataBind 메서드를 호출하여 nameTextField의 텍스트를 전달한다
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
        // navigationController의 pushViewController(_:animated:) 메서드를 호출하여 다음 뷰 컨트롤러를 푸시한다.
    }                 //이 함수는 화면 전환을 위해 두 번째 뷰 컨트롤러를 생성하고 데이터를 전달한 뒤, 첫 번째 뷰 컨트롤러의 navigationController를 사용하여 두 번째 뷰 컨트롤러로 이동하는 역할을 한다.
    
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()          //  "present" 버튼을 누르면 presentToSecondViewController() 함수를 호출하여 두 번째 뷰 컨트롤러를 present 한다.
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()             // push" 버튼을 누르면 pushToSecondViewController() 함수를 호출하여 두 번째 뷰 컨트롤러를 push 한다.
    }
}


private extension ExampleViewController {       // extension으로 선언했으니까 viewDidLoad 밑에 선언하면 된다.
    // ExampleViewController 클래스에 대한 extension으로, style()과 setLayout() 함수를 구현하고 있다.
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {    // forEach를 사용함으로써 nameLabel, nameTextField, presentButton, pushButton를 전부 돌며 레이아웃 잡음
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}
