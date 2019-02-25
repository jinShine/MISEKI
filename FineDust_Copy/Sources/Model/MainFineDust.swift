//
//  MainFineDust.swift
//  FineDust_Copy
//
//  Created by 승진김 on 25/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation

struct MainFineDust: Decodable {
    let list: [List]
    let totalCount: Int

    private enum CodingKeys: String, CodingKey {
        case list, totalCount
    }
}

struct List: Decodable {
    let stationName: String
    
    private enum CodingKeys: String, CodingKey {
        case stationName
    }
}
