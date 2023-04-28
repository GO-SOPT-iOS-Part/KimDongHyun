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
    
    let lineImage = UIImageView(image: UIImage(named: "Line"))
    
    private var appSettingData: [String] = ["이용권","1:1 문의내역","예약알림","회원정보 수정","프로모션 정보 수신 동의"]
    private var userSettingData: [String] = ["공지사항","이벤트","고객센터","티빙알아보기"]
    
    private let headerView = ProfileTableHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    private let tableCellView = UITableView()
    
    override func setLayout() {
        view.addSubviews(tableCellView)
        
        tableCellView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    override func setStyle() {
        view.backgroundColor = .tvingBlack
        
        tableCellView.do {
            $0.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
            $0.backgroundColor = .systemPink
            $0.delegate = self
            $0.dataSource = self
            $0.tableHeaderView = headerView  // 테이블뷰에 헤더를 넣는다는 코드
        }
    }
}

extension SettingTableViewController: UITableViewDelegate { }

extension SettingTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    //  성민이형이 쳐준거
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        switch section {
        case 0:
            return appSettingData.count
        case 1:
            return userSettingData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            // 가드문 쓴거
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell()}
            cell.configureCell(appSettingData[indexPath.row])
            return cell
        case 1:
            //가드문 안쓴거
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            cell.configureCell(userSettingData[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}


