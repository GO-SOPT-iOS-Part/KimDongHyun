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
    
    private let tableCellView = UITableView(frame: .zero, style: .plain)
    
    private let headerView = TableHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
    
    private let footerView = TableFooterView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
    // 위 코드가 버튼 푸터를 의미함
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
            $0.register(boundryLineView.self, forHeaderFooterViewReuseIdentifier: "boundryLineView")
            $0.backgroundColor = .tvingBlack
            $0.delegate = self
            $0.dataSource = self
            $0.tableHeaderView = headerView  // 테이블뷰에 헤더를 넣는다는 코드
            $0.tableFooterView = footerView  // 테이블뷰에 푸터를 넣는다는 코드
        }
    }
}


extension SettingTableViewController: UITableViewDelegate { }

extension SettingTableViewController: UITableViewDataSource {
    // 섹션의 헤더 관련 코드를 넣고 여기서 분기처리 해주면 됨 -> 그 함수가 ViewforHeaderinsection
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "boundryLineView") as! boundryLineView
        if section == 0  {
            return sectionHeader
        }
        else {
            return nil
        }// 분기처리
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    //    두번째 섹션 구분 선
//        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//            if section == 1 {
//                let footerView = UIView(frame: .init(x: 0, y: 0, width: 100, height: 30))
//                let seperator = UIView(frame: .init(x: 0, y: 0, width: 100, height: 1))
//                seperator.backgroundColor = .gray
//                footerView.addSubview(seperator)
//
////                seperator.snp.makeConstraints{
////                    $0.top.equalTo(section0).inset(17)
////                    $0.leading.trailing.equalToSuperview().inset(8)
////                    $0.bottom.equalTo(section1).inset(17)
//                }
//                return footerView
//
//        }

 

    //MARK: 각각의 Section에 불러올 cell 내용 지정
    // 아래 코드는 헤더뷰를 없앤다는 코드.......
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        return nil
    //    }
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
        return 0
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


