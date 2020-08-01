//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Ooi Kok Sing on 21/6/20.
//  Copyright © 2020 ECM. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videoFetched(_ videos: [Video])
    
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        
        guard url != nil else{
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URL Session object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there are any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parsing the date into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call the "videosFetched method of the delegate
                        self.delegate?.videoFetched(response.items!)
                    }
                    
                }
               // dump(response)
                
            }
            catch {
                
                
            }
        }
        
        // Kick off the task
        dataTask.resume()
    }
    
}
