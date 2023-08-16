//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

struct APIResponse: Decodable {
    let results: [Results]
}
struct Results: Decodable, Identifiable {
  
        let id: Int
        let name: String
        let status: String
        let species: String
        let type: String?
        let gender: String
        let location: Location
        let image: String
        let episode: [String]  
    }

    struct Location: Decodable {
        let name: String
    }



 

