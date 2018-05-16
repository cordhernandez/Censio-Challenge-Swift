//
//  SearchPhotos.swift
//  Censio Challenge Swift
//
//  Created by Cordero Hernandez on 5/16/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import Foundation

class SearchPhotos: NSObject {
    
    var photosAPI: String?
    typealias Callback = (Search) -> ()
    
    open func searchForPhotos(with query: String, callback: @escaping Callback) {
        
        photosAPI = "https://api.unsplash.com/search/photos?query=\(query)"
        guard let url = URL(string: photosAPI ?? "") else {
            
            debugPrint("Failed to get URL")
            return
        }
        
        getPhotosFrom(url: url, callback: callback)
    }
    
    func getPhotosFrom(url: URL, callback: @escaping Callback) {
        
        var request = URLRequest(url: url)
        request.setValue("Bearer 81b8b7cd36e4f6c1c5cc9aeffe6176885dae49e3810dd0e890eb790e6c566910", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                
                debugPrint("Error with Session Data Task: \(error.debugDescription)")
                return
            }
            
            guard let data = data else { return }
            self.parseJSON(from: data, callback: callback)
        }
    }
    
    func parseJSON(from data: Data, callback: @escaping Callback) {
        
        do {
            
            let decoder = JSONDecoder()
            let search = try decoder.decode(Search.self, from: data)
            callback(search)
        }
        catch {
            debugPrint(error.localizedDescription)
        }
    }
}
