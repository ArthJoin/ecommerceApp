//
//  BannerItemCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 19.10.2023.
//

import UIKit
import SnapKit


class BannerItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with model: HomeBannerItemModel){
        imageView.image = model.image
    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        setupViews()
        constaintViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Constants
    private enum UIConstants {
        static let imageSize: CGFloat = 304
    }
    
    //MARK: Private Properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
}

// MARK: - Private methods
extension BannerItemCell {
    func setupViews() {
        contentView.addSubview(imageView)
    }
    func constaintViews() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configureAppearance() {}
}
