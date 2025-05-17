//
//  MissionStatDto.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import Foundation

// MARK: - MissionStat
struct MissionStatDto: Codable {
    let isSuccess: Bool
    let code, message: String
    let result: MissionStatResult
}

// MARK: - Result
struct MissionStatResult: Codable {
    let title: String
    let countReward, countCurrent: Int
    let content, reward, periodType: String
    let images: [MissionStatImage]

    enum CodingKeys: String, CodingKey {
        case title
        case countReward = "count_reward"
        case countCurrent = "count_current"
        case content, reward, periodType, images
    }
  
  static let empty = MissionStatResult(title: "", countReward: 0, countCurrent: 0, content: "", reward: "", periodType: "", images: [])
}

// MARK: - Image
struct MissionStatImage: Codable, Hashable {
    let imageURL, date: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case date
    }
}
