//
//  CustomThirdViewCell.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 01.07.2022.
//

import UIKit

class CustomThirdViewCell: UICollectionViewCell {
    
    static let identifire = "ThirdViewCell"
    
    var data: AlbumModel? {
        didSet {
            guard let data = data else {
                return
            }
            image.image = data.image
            label.text = data.title
            count.text = String(data.count)
        }
    }
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.tintColor = .systemBlue
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = Metrics.labelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var count: UILabel = {
        let count = UILabel()
        count.textColor = .systemBlue
        count.font = Metrics.labelFont
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
        [image, label, count].forEach { contentView.addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
                image.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: Metrics.titleImageTopAnchorConstant),
                image.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor),
                image.widthAnchor.constraint(
                    equalToConstant: Metrics.titleImageWidthAnchorConstant),
                image.heightAnchor.constraint(
                    equalToConstant: Metrics.titleImageHeightAnchorConstant),

                label.topAnchor.constraint(
                    equalTo: image.topAnchor,
                    constant: Metrics.titleLabelTopAnchorConstant),
                label.leadingAnchor.constraint(
                    equalTo: image.leadingAnchor,
                    constant: Metrics.titleLabelLeadingAnchorConstant),

                count.topAnchor.constraint(equalTo: contentView.topAnchor),
                count.leadingAnchor.constraint(equalTo: label.trailingAnchor),
                count.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: Metrics.titleNumberTrailingAnchorConstant)
        ])
    }

    private struct Metrics {

        static let labelFont = UIFont(name: "system", size: 18)

        static let titleImageTopAnchorConstant: CGFloat = 5
        static let titleImageWidthAnchorConstant: CGFloat = 30
        static let titleImageHeightAnchorConstant: CGFloat = 30

        static let titleLabelTopAnchorConstant: CGFloat = 5
        static let titleLabelLeadingAnchorConstant: CGFloat = 50

        static let titleNumberTrailingAnchorConstant: CGFloat = -40
    }
}
