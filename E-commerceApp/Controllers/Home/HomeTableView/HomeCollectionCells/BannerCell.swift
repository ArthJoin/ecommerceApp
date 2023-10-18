//
//  BannerCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 17.10.2023.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    private let bannerImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constaintViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension BannerCell {
    func setupViews() {
        addView(bannerImage)
    }
    func constaintViews() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: topAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImage.heightAnchor.constraint(equalToConstant: 150),
            bannerImage.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    func configure(_ image: UIImage) {
        bannerImage.image = image
    }
}
