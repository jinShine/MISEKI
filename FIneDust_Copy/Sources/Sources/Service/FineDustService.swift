//
//  FineDustService.swift
//  FineDust_Copy
//
//  Created by 승진김 on 20/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation
import Alamofire

struct FineDustService: FineDustServiceType {

    func requestFineDustInfo(sido: String, completion: @escaping (Result<FineDustModel>) -> ()) {
            Alamofire.request(App.API.fetchMainFineDust(sidoName: sido))
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(FineDustModel.self, from: value)
                        print("Fetch Dust :", result)
                        completion(Result.success(result))
                    } catch {
                        print("Decodable Error")
                    }
                case.failure(let error):
                    completion(Result.failure(error))
                }
        }
    }
}


