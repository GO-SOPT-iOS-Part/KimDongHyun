//
//  BasicSetting.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/27.
//

import UIKit
import SnapKit
import Then

struct BasicSetting {
    let titleLabel: String
}

extension BasicSetting {
    static func dummy() -> [BasicSetting] {
        return [BasicSetting(titleLabel: "이용권"),
                BasicSetting(titleLabel: "1:1 문의내역"),
                BasicSetting(titleLabel: "예약알림"),
                BasicSetting(titleLabel: "회원정보 수정"),
                BasicSetting(titleLabel: "프로모션 정보 수신 동의"),
                BasicSetting(titleLabel: "공지사항"),
                BasicSetting(titleLabel: "이벤트"),
                BasicSetting(titleLabel: "고객센터"),
                BasicSetting(titleLabel: "티빙알아보기")]
    }
}

