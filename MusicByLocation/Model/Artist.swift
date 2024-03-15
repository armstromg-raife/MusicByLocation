//
//  Artist.swift
//  MusicByLocation
//
//  Created by Raife Armstrong on 15/3/24.
//

import Foundation

struct Artist:Codable{
    var name:String
    
    private enum CodingKeys: String, CodingKey{
        case name = "artistName"
    }
}
