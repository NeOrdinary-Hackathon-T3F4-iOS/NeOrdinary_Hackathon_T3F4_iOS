//
//  MissionDto.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

struct MissionDto: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: [Mission]
    
}

struct Mission: Codable {
    let id: Int
    let title: String
    let reward: String
    let status: String
    let periodType: String
}
