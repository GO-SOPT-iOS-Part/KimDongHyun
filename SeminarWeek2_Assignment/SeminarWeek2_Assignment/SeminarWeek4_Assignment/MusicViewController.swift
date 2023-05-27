//
//  MusicViewController.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/11.
//

import UIKit

import SnapKit
import Then

final class MusicViewController: BaseViewController {
    
    private let tableView = UITableView()
    
    //    private let dummy = Music.dummy()
    private var dummy:[MusicDatas] = [] // 이렇게 바꿔줍니다. (더미에서 받아온 값을 서버에서 받아온 값으로 수정)
    // 서버에서 받아온 배열이 없으니까, 일단 빈 배열로 선언해둔거에요.
    // 왜 배열인지 궁금하죠? 구조체 자체를 배열로 만들었기 때문이죠.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind() // 생명주기 안에서 뷰안에 들어갈 내용을 계속 reload함
    }
    
    override func setStyle() {
        tableView.do {
            $0.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.identifier)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .black
            $0.rowHeight = 100
            $0.delegate = self
            $0.dataSource = self
        }
    }
    override func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension MusicViewController: UITableViewDelegate {}
extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as? MusicTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
    
}

extension MusicViewController {
    func bind() {
        MusicLoadService.shared.musicLoad { response in
            switch response {
            case .success(let data):
                guard let data = data as? Musics else { return }    //Musics 안에 데이터가 들어가고 그걸 let data에 넣어요.
                self.dummy = data.data  // Music.data안에 있는 let data를 self.dummy에 넣어준다.
                // 옵셔널 안해주면 let data :[MusicDtas] Optional("동현") 이런식으로 떠요. 그래서 써야합니다.
                DispatchQueue.main.async {
                    self.tableView.reloadData()     // 다시 더 찾아볼께요.. 아마도 reload할 때 필요한 내용이 아닐까..
                }
                
                dump(data)
            default:
                return
            }
        }
    }
    
}
