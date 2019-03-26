//
//  AddressModel.swift
//  FineDust_Copy
//
//  Created by 승진김 on 05/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import Foundation

struct AddressModel: Decodable {
    var results: Results
    
    init() {
        results = Results()
    }
}

struct Results: Decodable {
    let common: Common
    var juso: [Juso]
    
    init() {
        common = Common(errorMessage: "", countPerPage: "", totalCount: "", errorCode: "", currentPage: "")
        juso = []
    }
}

struct Common: Decodable {
    let errorMessage: String
    let countPerPage: String
    let totalCount: String
    let errorCode: String
    let currentPage: String
}

struct Juso: Decodable {
    let siNm: String  // 서울특별시
    let sggNm: String // 동대문구
    let emdNm: String // 답십리
    let emdNo: String // 02
    
}

