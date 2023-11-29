//
//  CategoryItemCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 20.10.2023.
//

import UIKit

class CategoryItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with model: ProductCategoryItemModel){
        imageView.image = model.image
        label.text = model.title
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
        static let imageSize: CGFloat = 40
        static let imageToLabelOffset: CGFloat = -8
        static let textSize: CGFloat = 12
    }
    
    //MARK: Private Properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: UIConstants.textSize)
        return label
    }()
}

// MARK: - Private methods
extension CategoryItemCell {
    func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    func constaintViews() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalTo(label.snp.top).offset(UIConstants.imageToLabelOffset)
            make.size.equalTo(UIConstants.imageSize)
        }
        label.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    func configureAppearance() {
        label.textColor = Resources.Colors.separator
        label.textAlignment = .center
    }
}

