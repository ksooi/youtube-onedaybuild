//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Ooi Kok Sing on 21/6/20.
//  Copyright © 2020 ECM. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUTY7QED-uxqgUtU0COknFdg"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
