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
    
    //MARK: 구조체 대신 배열로 선언
    private var appSettingData: [String] = ["이용권","1:1 문의내역","예약알림","회원정보 수정","프로모션 정보 수신 동의"]
    private var userSettingData: [String] = ["공지사항","이벤트","고객센터","티빙알아보기"]

    private let navigationView = NavigationView()

//    private let NavigationView = UIView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
    private let tableCellView = UITableView(frame: .zero, style: .grouped)
    private let headerView = TableHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    private let footerView = TableFooterView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
   
    
    override func setLayout() {
        view.addSubviews(navigationView,tableCellView)
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(tableCellView.snp.top).offset(20)
            $0.height.equalTo(80)
        }
        
        tableCellView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        navigationController?.navigationBar.isHidden = true
    }
    override func setStyle() {
        view.backgroundColor = .tvingBlack
        
        tableCellView.do {
            $0.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
            $0.register(boundryLineView.self, forHeaderFooterViewReuseIdentifier: "boundryLineView")
            $0.backgroundColor = .tvingBlack
            $0.delegate = self
            $0.dataSource = self
            $0.tableHeaderView = headerView
            $0.tableFooterView = footerView
        }
    }
    
}

extension SettingTableViewController: UITableViewDelegate { }
// MARK: 분기처리
extension SettingTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: "boundryLineView") as! boundryLineView
        if section == 0  {
            return sectionFooter
        }
        else {
            return nil
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    //MARK: 각각의 Section에 불러올 cell 내용 지정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 30
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
    
    private func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    //MARK: 각각의 Cell에 맞게 지정
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
