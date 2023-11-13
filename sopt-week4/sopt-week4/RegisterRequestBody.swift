//
//  RegisterRequestBody.swift
//  sopt-week4
//
//  Created by 윤영서 on 11/11/23.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
