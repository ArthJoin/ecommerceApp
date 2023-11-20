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
        self.product = productById
        productImage.image = productById.image
        productName.text = productById.title
        productPrice.text = "$\(productById.subTitle)"
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private UIConstants
    private enum UIConstant {
        static let productNameFontSize: CGFloat = 15
        static let productPriceFontSize: CGFloat = 20
        static let productImageHeight: CGFloat = 250
        static let stackVerticalSpacing: CGFloat = 5
        static let offset: CGFloat = 15
        static let wishlistTrailingInset: CGFloat = 15
        static let animationDuration: CGFloat = 0.3
    }
    
    //MARK: - Private Properties
    private let footerDelegate = FooterProductDetail()
    private var footerBtnTapped = FooterProductDetail()
    private var product: ProductListItemModel?
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.image = DummyData.products.one
        return image
    }()
    private let productName: UILabel = {
        let label = UILabel()
        label.textColor = Resources.Colors.titleMain
        label.font = Resources.Fonts.helveticaRegular(with: UIConstant.productNameFontSize)
        return label
    }()
    private let productPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Resources.Fonts.systemWeight(with: UIConstant.productPriceFontSize, weight: .medium)
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
            make.height.equalTo(UIConstant.productImageHeight)
        }
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(productName)
        stack.addArrangedSubview(productPrice)
        stack.spacing = UIConstant.stackVerticalSpacing
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.offset)
            make.trailing.equalToSuperview()
            make.top.equalTo(productImage.snp.bottom).offset(UIConstant.offset)
            make.bottom.equalToSuperview().inset(UIConstant.offset)
        }
        contentView.addSubview(wishlistBtn)
        wishlistBtn.snp.makeConstraints { make in
            make.centerY.equalTo(stack)
            make.trailing.equalToSuperview().inset(UIConstant.wishlistTrailingInset)
        }
        
        wishlistBtn.addTarget(self, action: #selector(wishlistBtnAction), for: .touchDown)
    }
    
    @objc func wishlistBtnAction() {
        guard let item = self.product else { return }
        let product = MocNetworkManager.shared.getProductById(with: item.productId)
        if product.isWishlist {
            MocNetworkManager.shared.putProductListRemoveWishlist(with: item.productId)
            MocNetworkManager.shared.deleteProductFromWishlist(with: item.productId)
            UIView.animate(withDuration: UIConstant.animationDuration) {
                Resources.Images.buttons.wishlistInactive(with: self.wishlistBtn)
            }
        } else {
            MocNetworkManager.shared.putProductListAddWishlist(with: item.productId)
            MocNetworkManager.shared.postProductToWishlist(with: item)
            UIView.animate(withDuration: UIConstant.animationDuration) {
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

