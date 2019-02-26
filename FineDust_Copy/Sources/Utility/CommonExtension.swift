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
    func convertValueToStatus() -> String {
        switch self {
        case "1": return "좋음"
        case "2": return "보통"
        case "3": return "나쁨"
        default : return "매우나쁨"
        }
    }
    
    func convertValueToColor() -> UIColor {
        switch self {
        case "1": return UIColor.blue
        case "2": return UIColor.yellow
        case "3": return UIColor.orange
        default : return UIColor.red
        }
    }
}

