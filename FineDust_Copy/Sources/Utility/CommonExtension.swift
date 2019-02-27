//
//  CommonExtension.swift
//  FineDust_Copy
//
//  Created by 승진김 on 27/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var convertValueToStatus: String {
        switch self {
        case "1": return "좋음"
        case "2": return "보통"
        case "3": return "나쁨"
        default : return "매우나쁨"
        }
    }
    
    var convertValueToColor: UIColor {
        switch self {
        case "1": return UIColor.blue
        case "2": return UIColor.yellow
        case "3": return UIColor.orange
        default : return UIColor.red
        }
    }
//    (서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)

    var convertCityShortening: String {
        switch self {
        case "서울특별시": return "서울"
        case "부산광역시": return "부산"
        case "대구광역시": return "대구"
        case "인천광역시": return "인천"
        case "광주광역시": return "광주"
        case "대전광역시": return "대전"
        case "울산광역시": return "울산"
        case "경기도": return "경기"
        case "강원도": return "강원"
        case "충청북도": return "충북"
        case "충청남도": return "충남"
        case "전라북도": return "전북"
        case "전라남도": return "전남"
        case "경상북도": return "경북"
        case "경상남도": return "경남"
        case "제주도": return "제주"
        case "세종특별자치시": return "세종"
        default: return self
        }
    }
}

