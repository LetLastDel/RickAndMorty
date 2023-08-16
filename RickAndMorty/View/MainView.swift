//
//  MainView.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import UIKit

class MainView: UIView {

    let collectionView = UICollectionView(frame: CGRect(),
                                          collectionViewLayout: CompositionalLayoutService.shared.createLayout())
    let charLbl = UILabel()
    
    init(){
        super.init(frame: CGRect())
        setViews()
        setConstraints()
        backgroundColor = UIColor(named: "bg")
        collectionView.backgroundColor = UIColor(named: "bg")
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseID)
    }
    func setViews(){
        charLbl.text = "Characters"
        charLbl.font = .boldSystemFont(ofSize: 35)
        charLbl.textColor = .white
    }
    func setConstraints(){
        addSubview(charLbl)
        addSubview(collectionView)

        charLbl.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            charLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            charLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: charLbl.bottomAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
import SwiftUI

struct MainViewProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewRepresentable{
        typealias UIViewType = MainView
        let view = MainView()
        
        func makeUIView(context: Context) -> MainView {
            return view
        }
        
        func updateUIView(_ uiView: MainView, context: Context) { }
    }
}
