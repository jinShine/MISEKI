//
//  FineDustService.swift
//  FineDust_Copy
//
//  Created by 승진김 on 20/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation
import Alamofire

struct FineDustService: FindDustServiceType {

    func fetchFineDustInfo(completion: @escaping (Result<MainFineDust>) -> ()) {
            Alamofire.request(Router.fetchMainFineDust(sidoName: "인천"))
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(MainFineDust.self, from: value)
                        print("Fetch Dust :", result)
                        completion(Result.success(result))
                    } catch {
//                        print("dddd",Router.fetchMainFineDust
                        print("Catch")
                    }
                case.failure(let error):
                    print("ERRRRR",error)
                }
                
        }
    }

    
    
    //MARK:- Properties
}


