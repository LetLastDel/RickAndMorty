//
//  ChartViewModel.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var char: Results
    
    init(char: Results){
        self.char = char
    }
}

