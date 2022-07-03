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
        collection.showsVerticalScrollIndicator = false
        
        collection.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifire)
        collection.register(HeaderCustomSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCustomSection.identifier)
        
        collection.register(CustomSecondViewCell.self, forCellWithReuseIdentifier: CustomSecondViewCell.identifire)
        collection.register(HeaderSecondSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSecondSection.identifier)
        
        collection.register(CustomThirdViewCell.self, forCellWithReuseIdentifier: CustomThirdViewCell.identifire)
        collection.register(HeaderThirdSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderThirdSection.identifier)
        
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
                constant: Metrics.collectionViewTopAnchorConstant),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Metrics.collectionViewLeadingAnchorConstant),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Metrics.collectionViewTrailingAnchorConstant),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0: return self.layoutSectionFirstViewCell()
            case 1: return self.layoutSectionSecondViewCell()
            case 2: return self.layoutSectionThirdViewCell()
            default:
                return self.layoutSectionSecondViewCell()
            }
        }
    }
    func layoutSectionFirstViewCell() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metrics.collectionLayoutSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutSizeAbsolute))
        
        let HeaderSection = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(Metrics.collectionLayoutItemSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutItemSizeFractionalAbsolute))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(Metrics.collectionLayoutItemSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutGroupSizeFractionalAbsolute)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [HeaderSection]
        section.contentInsets = .init(top: 10, leading: 5, bottom: 5, trailing: 5)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func layoutSectionSecondViewCell() -> NSCollectionLayoutSection {

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metrics.collectionLayoutSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutSizeAbsolute))

        let HeaderSection = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metrics.collectionLayoutSizeFractionalWidth),
            heightDimension: .fractionalHeight(Metrics.collectionLayoutSizeFractionalHeight))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)


        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(Metrics.collectionLayoutItemSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutItemSizeFractionalAbsolute)
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [HeaderSection]
        section.contentInsets = .init(top: 10, leading: 0, bottom: 5, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func layoutSectionThirdViewCell() -> NSCollectionLayoutSection {

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metrics.collectionLayoutSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutSizeAbsolute))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metrics.collectionLayoutSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutSizeAbsolute))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Metrics.collectionLayoutSizeFractionalWidth),
            heightDimension: .absolute(Metrics.collectionLayoutGroupSizeFractionalAbsolute))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.contentInsets = .init(top: 10, leading: 0, bottom: 5, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous

        return section
    }
    
    private struct Metrics {
        static let collectionViewTopAnchorConstant: CGFloat = 10
        static let collectionViewLeadingAnchorConstant: CGFloat = 10
        static let collectionViewTrailingAnchorConstant: CGFloat = 0
        
        static let collectionLayoutSizeFractionalWidth: CGFloat = 1
        static let collectionLayoutSizeFractionalHeight: CGFloat = 1
        static let collectionLayoutSizeAbsolute: CGFloat = 50
        static let collectionLayoutItemSizeFractionalWidth: CGFloat = 180
        static let collectionLayoutItemSizeFractionalAbsolute: CGFloat = 240
        static let collectionLayoutGroupSizeFractionalAbsolute: CGFloat = 480
    }
}

