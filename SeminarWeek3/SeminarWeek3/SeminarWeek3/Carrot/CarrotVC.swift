//
//  Carrot VC.swift
//  SeminarWeek3
//
//  Created by 김동현 on 2023/04/22.
//


import UIKit
import Then
import SnapKit


class CarrotVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        setConfig()
    }
    
    func setLayout() {
            
            view.addSubview(tableView)
            
            tableView.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaInsets)
                $0.bottom.leading.trailing.equalToSuperview()
            }
        }
    
    private func setConfig() {
        tableView.do {
            $0.register(CarrotTVC.self, forCellReuseIdentifier: CarrotTVC.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
    private let tableView = UITableView()
    private let dummy = Carrot.dummy()
}

extension CarrotVC: UITableViewDelegate { }
extension CarrotVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return dummy.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTVC.identifier, for: indexPath) as? CarrotTVC else { return UITableViewCell() }
           
           cell.configureCell(dummy[indexPath.row])
           
           return cell
       }
   }
    


