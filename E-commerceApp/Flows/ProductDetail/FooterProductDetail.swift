//
//  FooterProductDetail.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 31.10.2023.
//

import UIKit

final class FooterProductDetail: BaseView {
    //MARK: - Public
    func configure(with product: HomeProductListItemModel) {
        self.product = product
        if product.isBasket {
            addToCardBtnTappedState(with: addToCardBtn)
        } else {
            addToCardBtnNormalState(with: addToCardBtn)
        }
    }
    
    //MARK: - Private Properties
    private var product: HomeProductListItemModel?
    private let addToCardBtn = UIButton()
    
    private let buyNowBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy Now", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        btn.backgroundColor = Resources.Colors.transpulentGray
        btn.layer.borderWidth = 1
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
            make.top.equalToSuperview().inset(10)
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
        addToCardBtn.addTarget(self, action: #selector(addToCardActionhighlighted), for: .touchDown)
    }
}

extension FooterProductDetail {
    @objc func addToCardActionhighlighted() {
        guard let product = product else { return }
        MocNetworkManager.shared.postProductToBasket(with: product)
        MocNetworkManager.shared.putProductListBasket(with: product.productId)
        UIView.animate(withDuration: 0.3) {
            self.addToCardBtnTappedState(with: self.addToCardBtn)
        }
    }
    
    func addToCardBtnTappedState(with btn: UIButton) {
        addToCardBtn.backgroundColor = Resources.Colors.active
        if let sysImage = UIImage(systemName: "checkmark") {
            let resizedImage = sysImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold))
            resizedImage.withTintColor(.white)
            btn.setTitle("", for: .normal)
            btn.setImage(resizedImage, for: .normal)
            btn.tintColor = .white
            btn.isEnabled = false
        }
    }
    func addToCardBtnNormalState(with btn: UIButton) {
        btn.setTitle("Add to Cart", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        btn.backgroundColor = Resources.Colors.transpulentGray
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Resources.Colors.separator.cgColor
        btn.layer.cornerRadius = 5
    }
}
