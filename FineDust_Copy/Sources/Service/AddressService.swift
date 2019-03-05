//
//  AddressService.swift
//  FineDust_Copy
//
//  Created by 승진김 on 05/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation
import Alamofire

struct AddressService: AddressServiceType {
    
    func requestAddress(regionName: String, completion: @escaping (Result<AddressModel>) -> ()) {
        Alamofire.request(Router.searchAddress(address: regionName))
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(AddressModel.self, from: value)
                        print(result)
                        completion(Result.success(result))
                    } catch {
                        print("Decodable Error")
                    }
                case .failure(let error):
                    completion(Result.failure(error))
                }
            }
    }
}
