//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    static let reuseID = "CharacterCell"
    
    let charImage = UIImageView(image: UIImage(named: "noAviable"))
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    func setViews(){
        backgroundColor = UIColor(named: "cellBG")
        layer.cornerRadius = 10
        clipsToBounds = true
        charImage.contentMode = .scaleAspectFit
        charImage.layer.cornerRadius = 10
        charImage.clipsToBounds = true
        charImage.alignmentRect(forFrame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .white
    }
    func setConstraints() {
        addSubview(charImage)
        charImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            charImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            charImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            charImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            charImage.heightAnchor.constraint(equalTo: charImage.widthAnchor)
        ])
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: charImage.bottomAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])


    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
import SwiftUI

struct CellViewProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewRepresentable{
        typealias UIViewType = CharacterCell
        let view = CharacterCell()
        
        func makeUIView(context: Context) -> CharacterCell {
            return view
        }
        
        func updateUIView(_ uiView: CharacterCell, context: Context) { }
    }
}
