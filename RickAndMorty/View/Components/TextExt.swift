//
//  TextExt.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import SwiftUI

struct TextExt: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.title2).bold()
    }
}


