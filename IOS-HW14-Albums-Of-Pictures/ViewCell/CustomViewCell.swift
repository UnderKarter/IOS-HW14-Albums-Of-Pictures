//
//  CustomViewCell.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 20.06.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
   static let identifire = "CellIndetifire"
    
    var data: AlbumModel? {
        didSet {
            guard let data = data else {
                return
            }
            image.image = data.image
            lable.text = data.title
            count.text = String(data.count)
        }
    }
    // Заглавная картинка альбома
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    // Название альбома
    lazy var lable: UILabel = {
        let label = UILabel()
        label.font = MetricData.labelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    // Кол-во элементов в альбоме
    lazy var count: UILabel = {
        let count = UILabel()
        count.textColor = .systemGray3
        count.font = MetricData.labelFont
        count.translatesAutoresizingMaskIntoConstraints = false
        count.textAlignment = .left
        return count
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        [image, lable, count].forEach { contentView.addSubview($0) }
    }
    
    // Настройка расположения
    private func setupLayout() {

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: MetricData.imageTopAnchorConstant),
            image.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                                constant: MetricData.imageLeadingAnchorConstant),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: MetricData.imageTrailingAnchorConstant),
            lable.topAnchor.constraint(equalTo: image.bottomAnchor, constant: MetricData.labelTopAnchorConstant),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricData.labelLeadingAnchorConstant),
            lable.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            count.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 2),
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lable.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    private struct MetricData {
        static let labelFont = UIFont(name: "system", size: 16)
        
        static let imageTopAnchorConstant: CGFloat = 0
        static let imageLeadingAnchorConstant: CGFloat = 0
        static let imageTrailingAnchorConstant: CGFloat = -8

        static let labelTopAnchorConstant: CGFloat = 8
        static let labelLeadingAnchorConstant: CGFloat = 20
        static let labelTrailingAnchorConstant: CGFloat = 5

        static let countTopAnchorConstant: CGFloat = 8
        static let countLeadingAnchorConstant: CGFloat = 20
        static let countTrailingAnchorConstant: CGFloat = 5
    }
}
