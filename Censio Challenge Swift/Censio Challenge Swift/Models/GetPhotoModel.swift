//
//  GetPhotoModel.swift
//  Censio Challenge Swift
//
//  Created by Cordero Hernandez on 5/22/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import Foundation

struct GetPhotoModel: Decodable {
    
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
    let urls: PhotoURLS?
    let links: PhotoLinks?
    let sponsored: Bool?
    let user: PhotoUser?
}

struct PhotoURLS: Decodable {
    
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}

struct PhotoLinks: Decodable {
    
    let `self`: String?
    let html: String?
    let download: String?
    let download_location: String?
}

struct PhotoUser: Decodable {
    
    let id: String?
    let updated_at: String?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let twitter_username: String?
    let portfolio_url: String?
    let bio: String?
    let location: String?
    let links: PhotoUserLinks?
    let profile_image: PhotoUserProfileImage?
    let instagram_username: String?
    let total_collections: Int?
    let total_likes: Int?
    let total_photos: Int?
}

struct PhotoUserLinks: Decodable {
    
    let `self`: String?
    let html: String?
    let photos: String?
    let likes: String?
    let portfolio: String?
    let following: String?
    let followers: String?
}

struct PhotoUserProfileImage: Decodable {
    
    let small: String?
    let medium: String?
    let large: String?
}
