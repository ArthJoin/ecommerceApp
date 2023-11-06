//
//  ProductDetailCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 27.10.2023.
//

import UIKit

final class ProductDetailCell: UITableViewCell {
    //MARK: - Public
    func configure(with id: Int) {
        self.isWishlist(with: id)
        let productById = MocNetworkManager.shared.getProductById(with: id)
        self.item = productById
        productImage.image = productById.image
        itemName.text = productById.title
        itemPrice.text = productById.subTitle
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
    private let footerDelegate = FooterProductDetail()
    private var footerBtnTapped = FooterProductDetail()
    private var item: HomeProductListItemModel?
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
    private let wishlistBtn = UIButton()
}

//MARK: - Private Method
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
            make.trailing.equalToSuperview().inset(20)
        }
        
        wishlistBtn.addTarget(self, action: #selector(wishlistBtnAction), for: .touchDown)
    }
    
    @objc func wishlistBtnAction() {
        guard let item = self.item else { return }
        let product = MocNetworkManager.shared.getProductById(with: item.productId)
        if product.isWishlist {
            MocNetworkManager.shared.putProductListRemoveWishlist(with: item.productId)
            MocNetworkManager.shared.deleteProductFromWishlist(with: item.productId)
            UIView.animate(withDuration: 0.3) {
                Resources.Images.buttons.wishlistInactive(with: self.wishlistBtn)
            }
        } else {
            MocNetworkManager.shared.putProductListAddWishlist(with: item.productId)
            MocNetworkManager.shared.postProductToWishlist(with: item)
            UIView.animate(withDuration: 0.3) {
                Resources.Images.buttons.wishlistActive(with: self.wishlistBtn)
            }
        }
    }
    
    func isWishlist(with productId: Int) {
        let product = MocNetworkManager.shared.getProductById(with: productId)
        if product.isWishlist {
            Resources.Images.buttons.wishlistActive(with: wishlistBtn)
        } else {
            Resources.Images.buttons.wishlistInactive(with: wishlistBtn)
        }
    }
}

