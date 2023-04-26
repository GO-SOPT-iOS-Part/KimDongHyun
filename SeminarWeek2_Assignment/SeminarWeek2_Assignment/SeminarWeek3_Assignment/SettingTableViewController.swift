//
//  SettingTableView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/26.
//

import UIKit

import SnapKit
import Then

class SettingTableViewController: BaseViewController {
    
    private let tableView = UITableView()
    private let dummy = BasicSetting.dummy()

    override func setLayout() {
        view.addSubviews(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    override func setStyle() {
        view.backgroundColor = .tvingBlack
        
        tableView.do {
            $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension SettingTableViewController: UITableViewDelegate { }

extension SettingTableViewController: UITableViewDataSource {
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}
        cell.configureCell(dummy[indexPath.row])
        return cell
    }

}


