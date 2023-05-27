//
//  Music.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/05/12.
//

import UIKit

struct Music {
    let image: UIImage
    let music: String
    let artist: String
}

extension Music {
    static func dummy() -> [Music] {
        return [
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "forest")!,
                  music: "숲",
                  artist: "최유리"),
            Music(image: UIImage(named: "antifreeze")!,
                  music: "antifreeze",
                  artist: "백예린"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "forest")!,
                  music: "숲",
                  artist: "최유리"),
            Music(image: UIImage(named: "antifreeze")!,
                  music: "antifreeze",
                  artist: "백예린"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "forest")!,
                  music: "숲",
                  artist: "최유리"),
            Music(image: UIImage(named: "antifreeze")!,
                  music: "antifreeze",
                  artist: "백예린"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴"),
            Music(image: UIImage(named: "forest")!,
                  music: "숲",
                  artist: "최유리"),
            Music(image: UIImage(named: "antifreeze")!,
                  music: "antifreeze",
                  artist: "백예린"),
            Music(image: UIImage(named: "good")!,
                  music: "잘 지내자 우리",
                  artist: "최유리"),
            Music(image: UIImage(named: "new")!,
                  music: "New Day",
                  artist: "폴킴")
        ]
    }
}
