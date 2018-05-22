//
//  SearchPhotos.swift
//  Censio Challenge Swift
//
//  Created by Cordero Hernandez on 5/16/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import Foundation

class SearchPhotos: NSObject {
    
    static var photosAPI: String?
    typealias Callback = (SearchPhotosModel) -> ()
    
    open static func searchForPhotos(with query: String, callback: @escaping Callback) {
        
        photosAPI = "https://api.unsplash.com/search/photos?query=\(query)"
        guard let url = URL(string: photosAPI ?? "") else {
            
            debugPrint("Failed to get URL")
            return
        }
        
        getPhotosFrom(url: url, callback: callback)
    }
    
    private static func getPhotosFrom(url: URL, callback: @escaping Callback) {
        
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
            let photosData = try decoder.decode(SearchPhotosModel.self, from: data)
            callback(photosData)
        }
        catch {
            debugPrint("Error decoding JSON: \(error.localizedDescription)")
        }
    }
}
