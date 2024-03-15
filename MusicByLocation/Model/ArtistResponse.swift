//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Raife Armstrong on 14/3/24.
//

import Foundation

struct ArtistResponse:Codable{
    var resultCount: Int
    var resuts:[Artist]
    
    private enum CodingKeys: String,CodingKeys{
        case resultCount
        case results
    }
}
