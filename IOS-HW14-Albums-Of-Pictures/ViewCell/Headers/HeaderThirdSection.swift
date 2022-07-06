//
//  HeaderThirdSection.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 01.07.2022.
//

import UIKit

class HeaderThirdSection: UICollectionReusableView {
    
    static let identifier = "HeaderThirdSection"


    private lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        return container
    }()

    private lazy var header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Типы медиафайлов"
        label.font = Metrics.labelFont
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }


    private func setupHierarchy() {
        addSubview(container)
        container.addSubview(header)
    }


    private func setupLayout() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor),
            container.heightAnchor.constraint(equalTo: heightAnchor),

            header.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: Metrics.labelLeadingAnchorConstant),
            header.centerYAnchor.constraint(
                equalTo: container.centerYAnchor),
        ])
    }


    struct Metrics {

        static let labelFont: UIFont = .boldSystemFont(ofSize: 25)
        static let labelLeadingAnchorConstant: CGFloat = 5
        static let buttonTrailingAnchorConstant: CGFloat = -15
    }
}
