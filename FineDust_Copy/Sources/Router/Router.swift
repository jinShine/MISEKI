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
    case searchAddress(address: String)
}

extension Router {
    
    static let fineDustServieceKey: NSString = "SzPfhMrL3JFss%2FoKrJXv0wP3v6WJA2RRJ4yqv23fmdow5QAx7tqO9ZMosASlFeXA9UV1Aqzs%2BMP17Ts25BrfGQ%3D%3D".removingPercentEncoding! as NSString
    static let addressServieceKey: NSString = "U01TX0FVVEgyMDE5MDIyODE2MTE1NTEwODU1MDE=".removingPercentEncoding! as NSString
    
    
    var baseURL: URL {
        switch self {
        case .searchAddress:
            return URL(string: "http://www.juso.go.kr/addrlink")!
        default:
            return URL(string: "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc")!
        }
    }
    
    var header: HTTPHeaders {
        switch self {
        case .fetchMainFineDust:
            return [:]
        case .searchAddress:
            return [:]
        }
    }

    var path: String {
        switch self {
        case .fetchMainFineDust:
            return "/getCtprvnRltmMesureDnsty"
        case .searchAddress:
            return "/addrLinkApi.do"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMainFineDust, .searchAddress:
            return .get
        }
    }

    var parameters: Parameters {
        switch self {
        case .fetchMainFineDust(let sidoName):
            return [
                "serviceKey": Router.fineDustServieceKey,
                "pageNo":1,
                "numOfRows":999,
                "sidoName":sidoName,
                "ver":1.3,
                "_returnType":"json"
            ]
        case .searchAddress(let address):
            return [
                "confmKey": Router.addressServieceKey,
                "currentPage":1,
                "countPerPage":99999,
                "keyword":address,
                "resultType":"json"
            ]
        }
    }
    
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {

        switch self {
        case .searchAddress:
            let url = self.baseURL.appendingPathComponent(self.path)
            var urlRequest = try URLRequest(url: url, method: self.method, headers: self.header)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: self.parameters)
            print(urlRequest)
            return urlRequest
        case .fetchMainFineDust:
            let url = self.baseURL.appendingPathComponent(self.path)
            var urlRequest = try URLRequest(url: url, method: self.method, headers: self.header)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: self.parameters)
            return urlRequest
        }
    }
}
