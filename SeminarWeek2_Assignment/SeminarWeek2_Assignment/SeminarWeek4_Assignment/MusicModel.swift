//
//  MusicStruct.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/12.
//

import Foundation

// MARK: - Welcome
struct Musics: Codable {            //큰 박스
    //    let date: String          // 작은 박스1
    let data: [MusicDatas]          // 밑에서 가져온 작은 박스 2 -> 포장되서 오는 느낌이라고 생각하면 좋아요
}

// MARK: - Datum
struct MusicDatas: Codable {        // 작은 박스2
    let name, artist: String
    let image: String
    //    let rank: Int
    //    let lastWeekRank: Int?
    //    let peakRank, weeksOnChart: Int
    
    //enum CodingKeys: String, CodingKey {
    //  case name, artist, image
    //        case lastWeekRank = "last_week_rank"    // json의 snake case를 swift의 cmael case로 바꿔주는 작업 과정.
    //        case peakRank = "peak_rank"
    //        case weeksOnChart = "weeks_on_chart"
    //  }
}



