//
//  PhotoCVC.swift
//  SeminarWeek3
//
//  Created by 김동현 on 2023/04/22.
//

import UIKit

import SnapKit
import Then

final class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    var handler: (() -> (Void))?
    let photoImage = UIImageView()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        button.do {
            $0.tintColor = .white
            $0.addTarget(self,
                         action: #selector(heartButtonTapped),
                         for: .touchUpInside)
        }
    }
    @objc
    func heartButtonTapped() {
        handler?()
    }
    func setLayout() {
        
        contentView.addSubview(photoImage)
        contentView.addSubview(button)
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(5)
            $0.size.equalTo(30)
        }
    }
    
    func configureCell(_ photo: Photo) {
        
        photoImage.image = photo.image
        isTapped = photo.heartTapped
    }
    var isTapped: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    func updateButton() {
        let image = isTapped ? "heart.fill" : "heart"
        button.setImage(UIImage(systemName: image), for: .normal)
    }
    
}
