//
//  CharInfoView.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import SwiftUI

struct CharacterInfoView: View {
    
    @StateObject var viewModel: CharacterViewModel
    
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                AsyncImage(url: URL(string:viewModel.char.image))
                    .frame(width: 250, height: 250)
                    .cornerRadius(15)
                Text(viewModel.char.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                Text(viewModel.char.status)
                    .foregroundColor(.green)
                    .bold()
                VStack(alignment: .leading){
                    TextExt(text: "Info")
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Species:")
                                Text(viewModel.char.type == nil ? "Type" : "")
                                Text("Gender:")
                            }.padding(.horizontal, 6)
                            Spacer()
                            VStack(alignment: .trailing){
                                Text(viewModel.char.species)
                                Text(viewModel.char.type ?? "")
                                Text(viewModel.char.gender)
                            }.padding(.horizontal, 6)
                        }
                    }
                    .modifier(StackExtOne(padding: false))
                    TextExt(text: "Origin")
                    HStack{
                        Image(systemName: "globe.americas")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(10)
                            .background(.gray.opacity(0.5))
                            .cornerRadius(10)
                        VStack(alignment: .leading){
                            Text(viewModel.char.location.name)
                            Text("Planet")
                                .foregroundColor(.green)
                        }
                        Spacer()
                    }
                    .modifier(StackExtOne(padding: true))
                    TextExt(text: "Episodes")
                    ForEach(viewModel.char.episode, id: \.self) { episod in
                        EpisodeCell(viewModel: EpisodeCellViewModel(url: episod))
                    }.padding(.vertical, 5)
                }.padding()
            }
        .preferredColorScheme(.dark)
        .background(Color("bg"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

