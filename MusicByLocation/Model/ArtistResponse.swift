//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Raife Armstrong on 14/3/24.
//

import Foundation

struct ArtistResponse:Codable{
    var count: Int
    var results:[Artist]
    
    private enum CodingKeys: String,CodingKey{
        case count = "resultCount"
        case results
    }
}
