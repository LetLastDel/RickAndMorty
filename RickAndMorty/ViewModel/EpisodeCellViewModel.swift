//
//  EpisodeCellViewModel.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

class EpisodeCellViewModel: ObservableObject {
    var url: String
    @Published var episod: Episode?
    @Published var progressView = true

    init(url: String){
        self.url = url
        Task {
            let epis = try await NetworkService.shared.getMovies(epis: url)
            DispatchQueue.main.async {
                self.episod = epis
                self.progressView.toggle()
            }
        }
    }
    func mskeString(text: String) -> String {
        var array: [String] = []
        for char in text{
            array.append(String(char))
        }
        var first = ""
        var second = ""
        if !array.isEmpty{
            array[1] == "0" ? (first = "") : (first = array[1])
            array[4] == "0" ? (second = "") : (second = array[4])
                let text = "Episode: \(first + array[2])" + "; " + "Season: \(second + array[5])"
                return text
            }
        return text
    }
}
