//
//  ProductDetailCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 27.10.2023.
//

import UIKit

class ProductDetailCell: UITableViewCell {
    //MARK: - Public
    func configure(wiht item: HomeProductListItemModel) {
        productImage.image = item.image
        itemName.text = item.title
        itemPrice.text = item.subTitle
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Properties
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.image = DummyData.products.one
        return image
    }()
    private let itemName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Resources.Fonts.helveticaRegular(with: 12)
        return label
    }()
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        return label
    }()
}

private extension ProductDetailCell {
    func initialize() {
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.height.equalTo(250)
        }
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(itemName)
        stack.addArrangedSubview(itemPrice)
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom).offset(15)
        }
    }
}
