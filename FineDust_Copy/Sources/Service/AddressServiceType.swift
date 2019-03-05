//
//  AddressServiceType.swift
//  FineDust_Copy
//
//  Created by 승진김 on 05/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation
import Alamofire

protocol AddressServiceType {
    func requestAddress(regionName: String, completion: @escaping (Result<AddressModel>) -> ())
}
