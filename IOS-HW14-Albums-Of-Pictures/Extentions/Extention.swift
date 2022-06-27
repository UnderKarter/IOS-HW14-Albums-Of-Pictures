//
//  Extention.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

extension AlbumsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // кол-во объектов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumModel.firstSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifire, for: indexPath) as! CustomCell
        cell.data = AlbumModel.firstSection[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCustomCell.identifier,
            for: indexPath) as! HeaderCustomCell
        return header
    }
}
