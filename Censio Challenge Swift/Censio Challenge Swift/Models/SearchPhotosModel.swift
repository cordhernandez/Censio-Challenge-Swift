//
//  SearchPhotos.swift
//  Censio Challenge Swift
//
//  Created by Cordero Hernandez on 5/16/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import Foundation

struct SearchPhotosModel: Decodable {
    
    let total: Int?
    let total_pages: Int?
    let results: [Results]
}


struct Results: Decodable {
    
    let id: String?
    let created_at: String?
    let width: Int?
    let height: Int?
    let color: String?
    let likes: Int?
    let liked_by_user: Bool?
    let description: String?
    let user: User
    let current_user_collections: [String?]
    let urls: URLS
    let links: Links
}

struct URLS: Decodable {
    
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}

struct Links: Decodable {
    
    let `self`: String?
    let html: String?
    let download: String?
}

struct User: Decodable {
    
    let id: String?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let instagram_username: String?
    let twitter_username: String?
    let portfolio_url: String?
    let profile_image: ProfileImage
    let links: UserLinks
}

struct ProfileImage: Decodable {
    
    let small: String?
    let medium: String?
    let large: String?
}

struct UserLinks: Decodable {
    
    let `self`: String?
    let html: String?
    let photos: String?
    let likes: String?
}

