//
//  MusicTableViewCell.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/11.
//

import UIKit

import SnapKit
import Then

final class MusicTableViewCell: UITableViewCell {

    
    static let identifier = "MusicTableViewCell"
    
    private lazy var musicImage = UIImageView()
    private let musicLabel = UILabel()
    private let artistLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        contentView.backgroundColor = .black
        backgroundColor = .black
        separatorInset.left = 10
        selectionStyle = .none
        
        musicImage.do {
            $0.layer.cornerRadius = 15
        }
        musicLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 18)
            $0.textColor = .white
        }
        artistLabel.do {
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textColor = .white
        }
    }
    
    func setLayout() {
        [musicImage, musicLabel, artistLabel].forEach { contentView.addSubview($0)}
        
        musicImage.snp.makeConstraints {
            $0.size.equalTo(80)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        musicLabel.snp.makeConstraints {
            $0.leading.equalTo(musicImage.snp.trailing).offset(15)
            $0.top.equalToSuperview().inset(30)
        }
        artistLabel.snp.makeConstraints {
            $0.leading.equalTo(musicImage.snp.trailing).offset(15)
            $0.top.equalTo(musicLabel.snp.bottom).offset(5)
        }
    }
    
    func configureCell(_ music: MusicDatas?) {
        if let imageURL = music?.image {
            musicImage.getImageFromURL(imageURL)
        }
        guard let music = music else{ return }
        musicLabel.text = music.name
        artistLabel.text = music.artist
    }
    
}

