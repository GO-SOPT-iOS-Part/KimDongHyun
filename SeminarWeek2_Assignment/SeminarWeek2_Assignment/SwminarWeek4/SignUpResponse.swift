//
//  SignUpResponse.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/06.
//


struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}
