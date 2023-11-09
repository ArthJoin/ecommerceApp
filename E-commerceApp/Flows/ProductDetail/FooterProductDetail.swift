//
//  FooterProductDetail.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 31.10.2023.
//

import UIKit

final class FooterProductDetail: BaseView {
    //MARK: - Public
    func configure(with productId: Int) {
        let productById = MocNetworkManager.shared.getProductById(with: productId)
        self.product = productById
        isBasket(with: productId)
    }
    
    //MARK: - Private Properties
    private var product: ProductListItemModel?
    private let addToCardBtn = UIButton()
    
    private let buyNowBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy Now", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        btn.backgroundColor = Resources.Colors.transpulentGray
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = Resources.Colors.separator.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
}

extension FooterProductDetail {
    override func setupViews() {
        super.setupViews()
        addSubview(addToCardBtn)
        addSubview(buyNowBtn)
    }
    override func constaintViews() {
        super.constaintViews()
        addToCardBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(70)
            make.height.equalTo(50)
            make.width.equalTo(170)
        }
        buyNowBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(addToCardBtn)
            make.height.equalTo(50)
            make.width.equalTo(170)
        }
    }
    override func configureAppearance() {
        super.configureAppearance()
        addToCardBtn.addTarget(self, action: #selector(addToCardActionhighlighted), for: .touchUpInside)
        addSeparator(is: false)
    }
}

extension FooterProductDetail {
    @objc func addToCardActionhighlighted() {
        guard let product = product else { return }
        MocNetworkManager.shared.postProductToBasket(with: product)
        MocNetworkManager.shared.putProductListAddBasket(with: product.productId)
        UIView.animate(withDuration: 0.3) {
            self.isBasket(with: product.productId)
        }
    }
    
    func isBasket(with productId: Int) {
        let product = MocNetworkManager.shared.getProductById(with: productId)
        if product.isBasket {
            addToCardBtn.backgroundColor = Resources.Colors.active
            if let sysImage = UIImage(systemName: "checkmark") {
                let resizedImage = sysImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold))
                resizedImage.withTintColor(.white)
                addToCardBtn.setTitle("", for: .normal)
                addToCardBtn.setImage(resizedImage, for: .normal)
                addToCardBtn.tintColor = .white
                addToCardBtn.layer.borderWidth = 0.5
                addToCardBtn.layer.borderColor = Resources.Colors.separator.cgColor
                addToCardBtn.layer.cornerRadius = 5
                addToCardBtn.isEnabled = false
            }
        } else {
            addToCardBtn.isEnabled = true
            addToCardBtn.setImage(UIImage(), for: .normal)
            addToCardBtn.setTitle("Add to Cart", for: .normal)
            addToCardBtn.setTitleColor(.black, for: .normal)
            addToCardBtn.titleLabel?.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
            addToCardBtn.backgroundColor = Resources.Colors.transpulentGray
            addToCardBtn.layer.borderWidth = 0.5
            addToCardBtn.layer.borderColor = Resources.Colors.separator.cgColor
            addToCardBtn.layer.cornerRadius = 5
        }
    }
}
