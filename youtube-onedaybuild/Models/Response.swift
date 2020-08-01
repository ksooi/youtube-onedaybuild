//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Ooi Kok Sing on 28/7/20.
//  Copyright © 2020 ECM. All rights reserved.
//

import Foundation

struct Response : Decodable {
    
    var items: [Video]?
    
    enum CodingKeys : String, CodingKey {
        
        case items
    }
    
  
    init (from decoder: Decoder) throws  {
        
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try containter.decode([Video].self, forKey: .items)
    
        
    }
    
   
}
