//
//  HeaderSecondSection.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 28.06.2022.
//

import UIKit

class HeaderSecondSection: UICollectionReusableView {

    static let identifier = "HeaderSecondSection"

    private lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        return container
    }()

    private lazy var header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Люди и места"
        label.font = Metrics.headerFont
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
                constant: Metrics.headerLeadingAnchorConstant),
            header.centerYAnchor.constraint(
                equalTo: container.centerYAnchor),
        ])
    }

    private struct Metrics {

        static let headerFont: UIFont = .boldSystemFont(ofSize: 20)
        
        static let headerTopAnchorConstant: CGFloat = 10
        static let headerLeadingAnchorConstant: CGFloat = 5
    }
}
