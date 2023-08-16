//
//  FilmModel.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

struct Episode: Decodable, Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
}
private enum CodingKeys: String, CodingKey {
    case id, name, airDate = "air_date", epidode
}
