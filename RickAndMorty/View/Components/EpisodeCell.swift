//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import SwiftUI

struct EpisodeCell: View {
    @StateObject var viewModel: EpisodeCellViewModel
    
    var body: some View {
        if !viewModel.progressView{
            VStack(alignment: .leading, spacing: 20){
                Text(viewModel.episod?.name ?? "")
                    .foregroundColor(.white)
                    .bold()
                HStack{
                    Text(viewModel.mskeString(text: viewModel.episod?.episode ?? ""))
                        .foregroundColor(.green)
                    Spacer()
                    Text(viewModel.episod?.airDate ?? "")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(Color("cellBG"))
            .cornerRadius(15)
        } else {
            HStack{
                Spacer()
                ProgressView()
                Spacer()
            }
        }
    }
}

