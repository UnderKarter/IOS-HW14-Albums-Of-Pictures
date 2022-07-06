//
//  Extention.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

extension AlbumsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    // кол-во объектов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberCell: Int = 0
        switch section {
        case 0:
            numberCell = AlbumModel.firstSection.count
        case 1:
            numberCell = AlbumModel.secondSection.count
        case 2:
            numberCell = AlbumModel.thirdSection.count
        case 3:
            numberCell = AlbumModel.fourthSection.count
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
            let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomSecondViewCell.identifire, for: indexPath) as! CustomSecondViewCell
            secondCell.data = AlbumModel.secondSection[indexPath.row]
            return secondCell
            
        case 2:
            let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomThirdViewCell.identifire, for: indexPath) as! CustomThirdViewCell
            thirdCell.data = AlbumModel.thirdSection[indexPath.row]
            return thirdCell
            
        case 3:
            let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomFourthViewCell.identifire, for: indexPath) as! CustomFourthViewCell
            fourthCell.data = AlbumModel.fourthSection[indexPath.row]
            return fourthCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let firstHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderCustomSection.identifier,
                for: indexPath) as! HeaderCustomSection
            return firstHeader
        case 1:
            let secondHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderSecondSection.identifier,
                for: indexPath) as! HeaderSecondSection
            return secondHeader
            
        case 2:
            let thirdHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderThirdSection.identifier,
                for: indexPath) as! HeaderThirdSection
            return thirdHeader
            
        case 3:
            let fourthHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderFourthSection.identifier,
                for: indexPath) as! HeaderFourthSection
            return fourthHeader
        default:
            return UICollectionReusableView()
        }
        
    }
}
