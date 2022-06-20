//
//  AlbumsViewController.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

struct Album {
    let title: String
    let array: [String]
}

var albums = [Album]()

class AlbumsViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"
        
        configureAddButton()
        setupCollectionView()
        configureData()
    }

    private func configureAddButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }
    
    func configureData() {
        albums.append(Album(title: "Недавние",
                            array: data))
        albums.append(Album(title: "Инстаграмм",
                            array: ["1","2","3"]))
        albums.append(Album(title: "Избранное",
                            array: ["1","2","3","10","9","7"]))
        albums.append(Album(title: "Природа",
                            array: ["6","4","3","2","9"]))
        albums.append(Album(title: "Недавние",
                            array: ["1","2","3"]))
        albums.append(Album(title: "Недавние",
                            array: ["1","2","3"]))
        albums.append(Album(title: "Недавние",
                            array: ["1","2","3"]))

    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1.4).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

