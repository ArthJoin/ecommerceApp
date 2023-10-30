//
//  ProductDetailCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 27.10.2023.
//

import UIKit

final class ProductDetailCell: UITableViewCell {
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
        label.textColor = Resources.Colors.titleMain
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        return label
    }()
    private let itemPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Resources.Fonts.systemWeight(with: 20, weight: .medium)
        return label
    }()
    private let wishlistBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(Resources.Images.TabBar.wishlist, for: .normal)
        let image = Resources.Images.TabBar.wishlist
        
        return btn
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
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(10)
        }
        contentView.addSubview(wishlistBtn)
        wishlistBtn.snp.makeConstraints { make in
            make.centerY.equalTo(stack)
            make.top.equalTo(productImage.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
}
