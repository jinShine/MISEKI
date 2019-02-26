//
//  Router.swift
//  FineDust_Copy
//
//  Created by 승진김 on 25/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Alamofire

/*
 http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=SzPfhMrL3JFss%2FoKrJXv0wP3v6WJA2RRJ4yqv23fmdow5QAx7tqO9ZMosASlFeXA9UV1Aqzs%2BMP17Ts25BrfGQ%3D%3D&numOfRows=10&pageNo=1&sidoName=%EC%9D%B8%EC%B2%9C&ver=1.3&_returnType=json
 */


enum Router {
    case fetchMainFineDust(sidoName: String)
}

extension Router {
    
    static let servieceKey: NSString = "SzPfhMrL3JFss%2FoKrJXv0wP3v6WJA2RRJ4yqv23fmdow5QAx7tqO9ZMosASlFeXA9UV1Aqzs%2BMP17Ts25BrfGQ%3D%3D".removingPercentEncoding! as NSString
    
    #if DEBUG
    var baseURL: URL {
        return URL(string: "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc")!
    }
    #else
    #endif
    
    var header: HTTPHeaders {
        switch self {
        case .fetchMainFineDust:
            return [:]
        }
    }

    var path: String {
        switch self {
        case .fetchMainFineDust:
            return "/getCtprvnRltmMesureDnsty"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMainFineDust:
            return .get
        }
    }

    var parameters: Parameters {
        switch self {
        case .fetchMainFineDust(let sidoName):
            return [
                "serviceKey": Router.servieceKey,
                "numOfRows":10,
                "pageNo":1,
                "sidoName":sidoName,
                "ver":1.3,
                "_returnType":"json"
            ]
        }
    }
    
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        
        let url = self.baseURL.appendingPathComponent(self.path)
        var urlRequest = try URLRequest(url: url, method: self.method, headers: self.header)
        
        switch self {
        case .fetchMainFineDust:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: self.parameters)
        }
        
        return urlRequest
    }
}
