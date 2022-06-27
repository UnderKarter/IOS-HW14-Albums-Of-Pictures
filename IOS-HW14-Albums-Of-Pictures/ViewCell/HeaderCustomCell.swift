//
//  HeaderCustomCell.swift
//  IOS-HW14-Albums-Of-Pictures
//
//  Created by temp user on 26.06.2022.
//

import Foundation
import UIKit

class HeaderCustomCell : UICollectionReusableView {
    
    static let identifier = "HeaderCollectionCell"
    
    private lazy var container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        return container
    }()
    
    private lazy var header: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Мои альбомы"
        lable.font = .boldSystemFont(ofSize: Metrics.labelSize)
        lable.textAlignment = .left
        lable.textColor = .black
        return lable
    }()
    
    private lazy var ButtonAll: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Все"
        lable.font = .systemFont(ofSize: Metrics.buttonSize)
        lable.textAlignment = .right
        lable.textColor = .systemBlue
        return lable
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
    
    
    func setupHierarchy() {
        addSubview(container)
        container.addSubview(header)
        container.addSubview(ButtonAll)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor),
            container.heightAnchor.constraint(equalTo: heightAnchor),

            header.leadingAnchor.constraint(equalTo: container.leadingAnchor,
                constant: Metrics.headerLeadingAnchorConstant),
            header.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            ButtonAll.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: Metrics.buttonTrailingAnchorConstant),
            ButtonAll.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    
    private struct Metrics {
        
        static let labelSize: CGFloat = 20
        static let buttonSize: CGFloat = 16
        
        static let headerTopAnchorConstant: CGFloat = 5
        static let headerLeadingAnchorConstant: CGFloat = 10
        static let buttonTrailingAnchorConstant: CGFloat = -15
    }
}
