//
//  StackExt.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//


import SwiftUI

struct StackExtOne: ViewModifier {
    var padding: Bool

    func body(content: Content) -> some View {
        content
            .padding(padding ? 8 : 0)
            .foregroundColor(.white)
            .frame(height: 80)
            .background(Color("cellBG"))
            .cornerRadius(15)
    }
}

