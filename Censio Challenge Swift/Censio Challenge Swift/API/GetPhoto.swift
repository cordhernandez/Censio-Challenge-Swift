//
//  GetPhoto.swift
//  Censio Challenge Swift
//
//  Created by Cordero Hernandez on 5/22/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import Foundation

class GetPhoto: NSObject {
    
    static var photoAPI: String?
    typealias Callback = (GetPhotoModel) -> ()
    
    open static func getPhoto(with id: String, callback: @escaping Callback) {
        
        photoAPI = "https://api.unsplash.com/photos/:id?id=\(id)"
        guard let url = URL(string: photoAPI ?? "") else {
            
            debugPrint("Failed to get URL")
            return
        }
        
        getPhotoFrom(url: url, callback: callback)
    }
    
    private static func getPhotoFrom(url: URL, callback: @escaping Callback) {
        
        var request = URLRequest(url: url)
        request.setValue("Bearer 81b8b7cd36e4f6c1c5cc9aeffe6176885dae49e3810dd0e890eb790e6c566910", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                
                debugPrint("Error with Session Data Task: \(error.debugDescription)")
                return
            }
            
            guard let data = data else { return }
            self.decodeJSON(from: data, callback: callback)
        }
        
        task.resume()
    }
    
    private static func decodeJSON(from data: Data, callback: @escaping Callback) {
        
        do {
            
            let decoder = JSONDecoder()
            let photoData = try decoder.decode(GetPhotoModel.self, from: data)
            print("This is the data: \(photoData)")
            callback(photoData)
        }
        catch {
            debugPrint("Error decoding JSON: \(error.localizedDescription)")
        }
    }
}
