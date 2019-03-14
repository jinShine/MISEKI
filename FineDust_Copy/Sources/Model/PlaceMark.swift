//
//  PlaceMark.swift
//  FineDust_Copy
//
//  Created by 승진김 on 27/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation
import CoreLocation

struct PlaceMark {
    var administrativeArea: String?     // ex) 서울특별시
    var locality: String?               // ex) 서초구
    var subLocality: String?            // ex) 서초동
    
    init(placeMark: CLPlacemark) {
        guard let administrativeArea = placeMark.administrativeArea,
            let locality = placeMark.locality,
            let subLocality = placeMark.subLocality else { return }
        
        self.administrativeArea = administrativeArea
        self.locality = locality
        self.subLocality = subLocality
    }
    
    init(administrativeArea: String, locality: String, subLocality: String) {
        self.administrativeArea = administrativeArea
        self.locality = locality
        self.subLocality = subLocality
    }
    
    init() {
        self.administrativeArea = ""
        self.locality = ""
        self.subLocality = ""
    }

}
