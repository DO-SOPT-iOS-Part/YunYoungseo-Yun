//
//  ImageCollectionData.swift
//  sopt-week3
//
//  Created by 윤영서 on 10/28/23.
//

import Foundation

struct ImageCollectionData {
    let image: String
    var isLiked: Bool
    
    init(image: String, isLiked: Bool) {
        self.image = image
        self.isLiked = isLiked
    }
}

