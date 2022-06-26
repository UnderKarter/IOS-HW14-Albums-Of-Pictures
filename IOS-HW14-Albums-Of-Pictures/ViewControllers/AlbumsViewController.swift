//
//  AlbumsViewController.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifire)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"
        
        configureAddButton()
        setupCollectionView()
    }
    // Создание кнопки "+"
    private func configureAddButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }
    
    // Настройка UICollectionView
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: MetricsAlbumsViewConroller.collectionViewTopAnchorConstant),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: MetricsAlbumsViewConroller.collectionViewLeadingAnchorConstant),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: MetricsAlbumsViewConroller.collectionViewTrailingAnchorConstant),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            return self.layoutSectionCellAlbumsViewCell()
        }
    }
    func layoutSectionCellAlbumsViewCell() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(MetricsAlbumsViewConroller.collectionLayoutItemSizeFractionalWidth),
            heightDimension: .absolute(MetricsAlbumsViewConroller.collectionLayoutItemSizeFractionalAbsolute))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(MetricsAlbumsViewConroller.collectionLayoutItemSizeFractionalWidth),
            heightDimension: .absolute(MetricsAlbumsViewConroller.collectionLayoutGroupSizeFractionalAbsolute)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 5, bottom: 5, trailing: 5)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private struct MetricsAlbumsViewConroller {
        static let collectionViewTopAnchorConstant: CGFloat = 5
        static let collectionViewLeadingAnchorConstant: CGFloat = 0
        static let collectionViewTrailingAnchorConstant: CGFloat = 0
        
        static let collectionLayoutSizeFractionalWidth: CGFloat = 1
        static let collectionLayoutSizeFractionalHeight: CGFloat = 1
        static let collectionLayoutSizeAbsolute: CGFloat = 50
        static let collectionLayoutItemSizeFractionalWidth: CGFloat = 180
        static let collectionLayoutItemSizeFractionalAbsolute: CGFloat = 240
        static let collectionLayoutGroupSizeFractionalAbsolute: CGFloat = 480
    }
}

