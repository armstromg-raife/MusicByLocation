//
//  StateController.swift
//  MusicByLocation
//
//  Created by Raife Armstrong on 14/3/24.
//

import Foundation

class StateController:ObservableObject{
    @Published var lastKnownLocation:String=""
    let locationHandler: LocationHandler=LocationHandler()
    
    func findMusic(){
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData(){
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func getArtists(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=Lionel%20Richie&entity=musicArtist")
        else{
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            if let data = data{
                print(String(decoding: data, as: UTF8.self))
            }
        }.resume()
    }
    
    func parseJson(json:Data)->ArtistResponse?{
        let decoder=JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json){
            return artistResponse
        } else{
            print("Error decoding JSON")
            return nil
        }
        
    }
}
