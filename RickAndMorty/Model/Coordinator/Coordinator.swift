//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import Foundation

class Coordinator: ObservableObject {
    
    static let shared = Coordinator()

    @Published var selectedValue: Results?
    
    func didSelectItem(_ value: Results) {
        selectedValue = value
    }
}
