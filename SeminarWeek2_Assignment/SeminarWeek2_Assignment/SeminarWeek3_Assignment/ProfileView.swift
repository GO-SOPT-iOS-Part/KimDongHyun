//
//  ProfileView.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/26.

import UIKit

import SnapKit
import Then

final class ProfileView: UIView {
    
    let profileImage = UIImageView().then {
        $0.image = (UIImage.Image.profileImage)
    }
    
    let nicknameLabel = UILabel().then {
        $0.textColor = .tvingWhite
        $0.font = .tvingSemiBold(ofSize: 17)
        $0.text = "아요왕이될 김동현"
    }
    
    let profileChangeButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.backgroundColor = .tvingBlack
        $0.layer.borderColor = UIColor(named: "gray4")?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 2
        $0.contentEdgeInsets = UIEdgeInsets(top: 6, left: 11, bottom: 6, right: 11)
        $0.titleLabel?.font = .tvingMedium(ofSize: 16)
        $0.titleLabel?.textColor = .tvingWhite
    }
    
    let myTicketLabel1: UILabel = {
        let label = UILabel()
        let leadingImage = NSTextAttachment(image: UIImage(systemName: "play.rectangle")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: " 나의 이용권"))
        label.attributedText = attributedString
        label.textColor = .tvingGray3
        label.font = .tvingMedium(ofSize: 13)
        return label
    }()
    
    let myTicketLabel2 = UILabel().then {
        $0.textColor = .tvingGray3
        $0.font = .tvingMedium(ofSize: 13)
        $0.text = "사용중인 이용권이 없습니다."
    }
    
    let myCashLabel1: UILabel = {
        let label = UILabel()
        let leadingImage = NSTextAttachment(image: UIImage(systemName:"c.circle")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: "  티빙캐시"))
        label.attributedText = attributedString
        label.textColor = .tvingGray3
        label.font = .tvingMedium(ofSize: 13)
        return label
    }()
    
    let myCashLabel2 = UILabel().then {
        $0.textColor = .tvingWhite
        $0.font = .tvingBold(ofSize: 15)
        $0.text = "0"
    }
    
    let background1 = UIView().then {
        $0.backgroundColor = .tivingGray5
        $0.layer.cornerRadius = 3
    }
    
    private let enjoyLabel: UILabel = {
        let label = UILabel()
        let leadingImage = NSTextAttachment(image: UIImage(named: "channelImage")!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "이용권을 구매하고  "))
        attributedString.append(NSAttributedString(attachment: leadingImage))
        leadingImage.bounds = CGRectMake(0, 0, 48, 10)
        attributedString.append(NSAttributedString(string: "  등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"))
        label.numberOfLines = 2
        label.attributedText = attributedString
        label.textColor = .tvingGray2
        label.font = .tvingMedium(ofSize: 12)
        return label
    }()
    
    let nextButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_next"), for: .normal)
        $0.isSelected = true
    }
    
    let background2 = UIView().then {
        $0.backgroundColor = .tivingGray5
        $0.layer.cornerRadius = 3
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("ProfileView Error!")
    }
    private func setStyle() {
        self.backgroundColor = .tvingBlack
    }
    private func setLayout() {
        self.addSubviews(profileImage,nicknameLabel,profileChangeButton,background1,background2)
        background1.addSubviews(myTicketLabel1,myTicketLabel2,myCashLabel1,myCashLabel2)
        background2.addSubviews(enjoyLabel,nextButton)
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(123)
            $0.leading.equalToSuperview().offset(24)
            $0.height.width.equalTo(74)
        }
        nicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(145)
            $0.leading.equalTo(profileImage.snp.trailing).offset(22)
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(140)
            $0.trailing.equalToSuperview().inset(23)
        }
        background1.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(29)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        myTicketLabel1.snp.makeConstraints {
            $0.top.equalTo(background1).inset(18)
            $0.leading.equalTo(background1).offset(11)
        }
        myTicketLabel2.snp.makeConstraints {
            $0.top.equalTo(background1).inset(18)
            $0.trailing.equalTo(background1).inset(13)
        }
        myCashLabel1.snp.makeConstraints{
            $0.top.equalTo(myTicketLabel1.snp.bottom).offset(20)
            $0.leading.equalTo(background1).offset(11)
        }
        myCashLabel2.snp.makeConstraints {
            $0.top.equalTo(myTicketLabel2.snp.bottom).offset(20)
            $0.trailing.equalTo(background1).inset(13)
            
        }
        background2.snp.makeConstraints {
            $0.top.equalTo(background1.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        enjoyLabel.snp.makeConstraints {
            $0.top.equalTo(background2).inset(16)
            $0.leading.equalTo(background2).inset(16)
        }
        nextButton.snp.makeConstraints {
            $0.top.equalTo(background2).inset(20)
            $0.trailing.equalTo(background2).inset(13)
        }
    }
}








