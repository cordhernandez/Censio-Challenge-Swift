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
    let exif: Exif
    let location: Location
    let current_user_collections: [CurrentUserCollections]
}

struct Exif: Decodable {
    
    let make: String?
    let model: String?
    let exposure_time: String?
    let aperture: String?
    let focal_length: String?
    let iso: Int?
}

struct Location: Decodable {
    
    let city: String?
    let country: String?
    let position: Position
}

struct Position: Decodable {
    
    let latitude: Double?
    let longitude: Double?
}

struct CurrentUserCollections: Decodable {
    
    let id: Int?
    let title: String?
    let published_at: String?
    let updated_at: String?
    let curated: Bool?
    let cover_photo: UserCoverPhoto
    
}

struct UserCoverPhoto: Decodable {
    
    let id: String?
    let width: Int?
    let height: Int?
    let color: String?
    let likes: Int?
    let liked_by_user: Bool?
    let description: String?
    let user: CoverPhotoUser
    let urls: UserURLS
    let links: UserCoverPhotoLinks
    
}

struct UserURLS: Decodable {
    
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}

struct UserCoverPhotoLinks: Decodable {
    
    
}

struct CoverPhotoUser: Decodable {
    
    let id: String?
    let username: String?
    let name: String?
    let first_name: String?
    let last_name: String?
    let instagram_username: String?
    let twitter_username: String?
    let portfolio_url: String?
    let bio: String?
    let location: String?
    let total_likes: Int?
    let total_photos: Int?
    let total_collections: Int?
    let profile_image: PhotoUserProfileImage
    let links: PhotoUserLinks
}

struct PhotoUserProfileImage: Decodable {
    
    let small: String?
    let medium: String?
    let large: String?
}

struct PhotoUserLinks: Decodable {
    
    let `self`: String?
    let html: String?
    let photos: String?
    let likes: String?
    let portfolio: String?
}















