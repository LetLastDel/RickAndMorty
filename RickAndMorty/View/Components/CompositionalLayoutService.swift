//
//  CompositionalLayoutService.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import UIKit


class CompositionalLayoutService {
    static let shared = CompositionalLayoutService(); private init() { }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.6))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
      
            group.interItemSpacing = .fixed(16)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.interGroupSpacing = 16
            
            return section
            }
        
        return layout
        }
    }

