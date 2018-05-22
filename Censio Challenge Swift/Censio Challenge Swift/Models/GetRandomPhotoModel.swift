//
//  GetRandomPhotoModel.swift
//  Censio Challenge Swift
//
//  Created by Cordero Hernandez on 5/22/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import Foundation

struct GetRandomPhotoModel: Decodable {
    
    let id: String?
    let created_at: String?
    let updated_at: String?
    let width: Int?
    let height: Int?
    let color: String?
    let downloads: Int?
    let likes: Int?
    let liked_by_user: Bool?
    let description: String?
}
