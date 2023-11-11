//
//  WishlistTableCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 02.11.2023.
//

import UIKit

final class WishlistTableCell: UITableViewCell {
    //MARK: - Public
    func configure(with product: ProductListItemModel) {
        self.isWishlist(with: product.productId)
        self.product = product
        productImage.image = product.image
        productName.text = product.title
        productPrice.text = "$\(product.subTitle)"
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
    private let wishlistBtn = UIButton()
    private var product: ProductListItemModel?
    
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.image = DummyData.products.one
        return image
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 12, weight: .medium)
        label.text = DummyData.products.title
        return label
    }()
    
    private let productPrice: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        label.text = "$\(DummyData.products.subTitle)"
        return label
    }()
}

//MARK: - Private Methods
extension WishlistTableCell {
    func initialize() {
        contentView.addSubview(wishlistBtn)
        wishlistBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview()
        }
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.leading.equalTo(wishlistBtn.snp.trailing).offset(15)
            make.top.bottom.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.width.equalTo(70)
        }
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(productName)
        stack.addArrangedSubview(productPrice)
        stack.spacing = 10
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.equalTo(productImage.snp.trailing).offset(10)
            make.centerY.equalTo(productImage)
        }
        
        wishlistBtn.addTarget(self, action: #selector(wishlistBtnAction), for: .touchDown)
        
    }
}

extension WishlistTableCell {
    @objc func wishlistBtnAction() {
        guard let item = self.product else { return }
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
