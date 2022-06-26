//
//  Model.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import Foundation
import UIKit

struct AlbumModel {
    let title: String
    let image: UIImage?
    let count: Int
}

extension AlbumModel {
static let firstSection = [
    AlbumModel(title: "Недавние", image: UIImage(named: "1"), count: 1209),
    AlbumModel(title: "Избранное", image: UIImage(named: "2"), count: 109),
    AlbumModel(title: "Instagram", image: UIImage(named: "3"), count: 10),
    AlbumModel(title: "Natural", image: UIImage(named: "4"), count: 51),
    AlbumModel(title: "Dream", image: UIImage(named: "5"), count: 32)
]
}
