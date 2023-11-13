//
//  NicknameDataModel.swift
//  sopt-week4
//
//  Created by 윤영서 on 11/11/23.
//

import Foundation

struct NickNameDataModel: Codable {
    let isExist: Bool
    
    enum CodingKeys: CodingKey {
        case isExist
    }
}
