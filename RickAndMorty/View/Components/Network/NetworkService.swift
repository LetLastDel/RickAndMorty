//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation
import UIKit

class NetworkService{
    static let shared = NetworkService(); private init() { }
    
    func getInfo(end: String, epis: String) async throws -> [APIResponse]{
        guard let url = URLManager.shared.createURL(endPoint: end, episodes: epis) else { throw NetworkError.badUrl }
        print(url)
        do{
            let responce = try await URLSession.shared.data(from: url)
            let data = responce.0
            let decoder = JSONDecoder()
            do{
                if let charData = try? decoder.decode(APIResponse.self, from:  data){
                    return [charData]
                } else {
                    print("invalid decoding")
                    throw NetworkError.invalidDecoding
                }
            } catch {
                throw NetworkError.invalidDecoding
            }
        }
    }
    func getMovies(epis: String) async throws -> Episode{
        guard let url = URLManager.shared.createURL(endPoint: "", episodes: epis) else { throw NetworkError.badUrl }
        print(url)
        do{
            let responce = try await URLSession.shared.data(from: url)
            let data = responce.0
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do{
                if let charData = try? decoder.decode(Episode.self, from:  data){
                    return charData
                } else {
                    print("invalid decoding")
                    throw NetworkError.invalidDecoding
                }
            } catch {
                throw NetworkError.invalidDecoding
            }
        }
    }
    
    
    func getImage(url: String) async throws -> UIImage {
        guard let url = URL(string: url) else { throw NetworkError.badUrl }
        let responce = try await URLSession.shared.data(from: url)
        let data = responce.0
        
        guard let image = UIImage(data: data) else { throw NetworkError.invalidImageData }
        return image
    }
}
    
enum NetworkError: Error {
    case badUrl
    case badResponse
    case invalidDecoding
    case invalidImageData
}

