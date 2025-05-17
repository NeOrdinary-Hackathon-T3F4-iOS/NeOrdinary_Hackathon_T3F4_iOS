//
//  ItemCountDto.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/18/25.
//

// 최상위 응답 구조체
struct ItemCountDto: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: CountResult
}

// result 안의 데이터 구조체
struct CountResult: Codable {
    let count: Int
}
