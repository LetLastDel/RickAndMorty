//
//  URLManager.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

class URLManager {
    static let shared = URLManager(); private init() { }
    private let tunnel = "https://"
    private let server = "rickandmortyapi.com/api/"
    
    
    func createURL(endPoint: String, episodes: String) -> URL?{
        if endPoint.isEmpty{
            return URL(string: episodes)
        } else {
            let url = tunnel + server + EndPoints.characher.rawValue
            return URL(string: url)
        }
    }
}
enum EndPoints: String {
    case characher = "character"
    case location = "location"
    case episode = "episode"
    case nothing = ""
}
