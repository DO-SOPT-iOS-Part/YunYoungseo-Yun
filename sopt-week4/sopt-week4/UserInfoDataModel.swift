//
//  UserInfoDataModel.swift
//  sopt-week4
//
//  Created by 윤영서 on 11/11/23.
//

import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
        case isExist
    }
    
    let isExist: Bool
}

