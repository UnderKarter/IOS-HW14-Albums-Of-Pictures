//
//  Extention.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

extension AlbumsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // кол-во объектов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberCell: Int = 0
        switch section {
        case 0:
            numberCell = AlbumModel.firstSection.count
        case 1:
            numberCell = AlbumModel.secondSection.count
        default:
            break
        }
        return numberCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifire, for: indexPath) as! CustomCell
            firstCell.data = AlbumModel.firstSection[indexPath.row]
            return firstCell
            
        case 1:
            let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifire, for: indexPath) as! CustomCell
            secondCell.data = AlbumModel.secondSection[indexPath.row]
            return secondCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let firstHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderCustomCell.identifier,
                for: indexPath) as! HeaderCustomCell
            return firstHeader
        case 1:
            let secondHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderSecondSection.identifier,
                for: indexPath) as! HeaderSecondSection
            return secondHeader
        default:
            return UICollectionReusableView()
        }
        
    }
}
