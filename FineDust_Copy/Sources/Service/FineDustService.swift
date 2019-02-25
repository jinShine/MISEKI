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
    
    func fetchFineDustInfo(completion: @escaping (DataResponse<[MainFineDust]>) -> ()) {
//        print(Router.fetchMainFineDust.urlRequest)
//        Alamofire.request(URL(string: "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=SzPfhMrL3JFss%2FoKrJXv0wP3v6WJA2RRJ4yqv23fmdow5QAx7tqO9ZMosASlFeXA9UV1Aqzs%2BMP17Ts25BrfGQ%3D%3D&numOfRows=10&pageNo=1&sidoName=%EC%9D%B8%EC%B2%9C&ver=1.3&_returnType=json")!)
            Alamofire.request(Router.fetchMainFineDust)
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
//                        print("dddd",Router.fetchMainFineDust)
//                        let result = try JSONDecoder().decode([MainFineDust].self, from: value)
                        let dd = try JSONSerialization.jsonObject(with: value, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : Any]
                        
//                        print("RRRRR",dd)
//                        completion(dd)
                    } catch {
//                        print("dddd",Router.fetchMainFineDust)
                        print("Catch")
                    }
                case.failure(let error):
                    print("ERRRRR",error)
                }
                
        }
    }

    
    
    //MARK:- Properties
}


