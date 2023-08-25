//
//  ViewController.swift
//  RickAndMorty
//
//  Created by A.Stelmakh on 16.08.2023.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    let mainView = MainView()
    var char: [Results] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        fetchInfo()
    }
    
    
    func fetchInfo(){
        Task{
            let apiResponce = try await NetworkService.shared.getInfo(end: EndPoints.characher.rawValue, epis: "") as [APIResponse]
            var charInfo: [Results] = []
            for resp in apiResponce {
                charInfo.append(contentsOf: resp.results)
            }
            DispatchQueue.main.async {
                self.char = charInfo
                self.mainView.collectionView.reloadData()
            }
        }
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        char.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as! CharacterCell
        let characterInfo = char[indexPath.item]
        cell.nameLabel.text = characterInfo.name
        Task{
            cell.charImage.image = try await NetworkService.shared.getImage(url: characterInfo.image)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = char[indexPath.row]
        self.navigationController?.pushViewController(UIHostingController(rootView: CharacterInfoView(viewModel: CharacterViewModel(char: selected))), animated: true)
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.tintColor = .white
    }
}
