//
//  ChartViewModel.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var coordinator: Coordinator?
    @Published var char: Results
    
    init(char: Results){
        self.char = char
        checkCoordinator()
    }
    
    func checkCoordinator() {
        guard let character = coordinator?.selectedValue else { return }
        self.char = character
    }
}

