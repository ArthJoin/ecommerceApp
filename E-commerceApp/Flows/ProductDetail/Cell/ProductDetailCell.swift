//
//  ProductDetailCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 27.10.2023.
//

import UIKit

//MARK: - Delegate
protocol ProductDetailCellDelegate: AnyObject {
    func didAddToCardWithProductId(with productId: Int)
}

final class ProductDetailCell: UITableViewCell {
    //MARK: - Public
    func configure(wiht item: HomeProductListItemModel) {
        self.item = item
        productImage.image = item.image
        itemName.text = item.title
        itemPrice.text = item.subTitle
    }
    weak var delegate: ProductDetailCellDelegate?
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        footerBtnTapped.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Properties
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
    private let wishlistBtn: UIButton = {
        let btn = UIButton()
        if let systemImage = UIImage(systemName: "heart") {
            let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
            
            btn.setImage(resizedImage, for: .normal)
        }
        btn.tintColor = Resources.Colors.inactive
        let image = Resources.Images.TabBar.wishlist
        return btn
    }()
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
        
        wishlistBtn.addTarget(self, action: #selector(wishlistBtnAction), for: .touchUpInside)
    }
    
    @objc func wishlistBtnAction() {
        if wishlistBtn.isSelected {
            UIView.animate(withDuration: 0.3) {
                if let systemImage = UIImage(systemName: "heart") {
                    let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
                    self.wishlistBtn.setImage(resizedImage, for: .normal)
                }
                self.wishlistBtn.tintColor = Resources.Colors.inactive
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                if let systemImage = UIImage(systemName: "heart.fill") {
                    let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
                    self.wishlistBtn.setImage(resizedImage, for: .normal)
                }
                self.wishlistBtn.tintColor = .red
            }
        }
        
        wishlistBtn.isSelected = !wishlistBtn.isSelected
    }
}

//MARK: - Delegate
extension ProductDetailCell: FooterProductDetailDelegate {
    func didAddToCard() {
        delegate?.didAddToCardWithProductId(with: item?.productId ?? 101)
    }
}
