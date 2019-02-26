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
    
    let pm10Value: String           // 미세먼지 농도 ex) 71
    let pm10Grade: String           // 미세먼지 등급 ex) { 좋음 : 1, 보통 : 2, 나쁨 : 3, 매우나쁨 : 4 }
    let pm25Value: String           // 초미세먼지 농도
    let pm25Grade: String           // 초미세먼지 등급
    let no2Value: String            // 이산화질소 농도
    let no2Grade: String            // 이산화질소 등급
    let o3Value: String             // 오존 농도
    let o3Grade: String             // 오존 등급
    let co2Value: String            // 일산화탄소 농도
    let co2Grade: String            // 일산화탄소 등급
    let so2Value: String            // 아황산가스 농도
    let so2Grade: String            // 아황산가스 등급
    
    let dataTime: String            // 측정일시
    let stationName: String         // 측정소명
    
    private enum CodingKeys: String, CodingKey {
        case pm10Value, pm10Grade, pm25Value, pm25Grade, dataTime, stationName, no2Value, no2Grade, o3Value, o3Grade,
        co2Value, co2Grade, so2Value, so2Grade
    }
}
