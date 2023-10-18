//
//  CategoryItemCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 19.10.2023.
//

import UIKit
import SnapKit

class CategoryItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with model: HomeCategoryItemModel){
        imageView.image = model.image
        title.text = model.title
    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Constants
    private enum UIConstants {
        static let titleFontSize: CGFloat = 12
    }
    
    //MARK: - Private Properties
    private var imageView: UIImageView {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }
    private var title: UILabel {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegular(with: UIConstants.titleFontSize)
        return lable
    }
}

// Private methods
private extension CategoryItemCell {
    func initialize() {
        let categoryStack = UIStackView()
        categoryStack.axis = .vertical
        categoryStack.addArrangedSubview(imageView)
        categoryStack.addArrangedSubview(title)
        contentView.addSubview(categoryStack)
        categoryStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
