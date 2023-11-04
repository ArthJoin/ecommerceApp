//
//  ProductItemCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 20.10.2023.
//

import UIKit

class ProductItemCell: UICollectionViewCell {
    var buttonAction: ((Int) -> Void)?
    
    //MARK: - Public
    func configure(with product: HomeProductListItemModel){
        item = product
        image.image = product.image
        title.text = product.title
        subTitle.text = product.subTitle
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
        static let productImageHeight: CGFloat = 112
        static let productImageWidth: CGFloat = 170
        static let insertOffset: CGFloat = 13
        static let viewCornerRadius: CGFloat = 7
        static let titleFontSize: CGFloat = 12
        static let subTitleFontSize: CGFloat = 17
        static let btnCornerRadius: CGFloat = 10
        static let viewHeight: CGFloat = 217
        static let viewWidth: CGFloat = 170
    }
    
    //MARK: Private Properties
    private var item: HomeProductListItemModel!
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.backgroundElement
        view.layer.cornerRadius = UIConstants.viewCornerRadius
        return view
    }()

    private var image: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private var title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: UIConstants.titleFontSize)
        label.textColor = .black
        return label
    }()
    private var subTitle: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: UIConstants.subTitleFontSize, weight: .semibold)
        return label
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Resources.Colors.active
        button.layer.cornerRadius = UIConstants.btnCornerRadius
        return button
    }()
}

// MARK: - Private methods
extension ProductItemCell {
    func initialize() {
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.viewHeight)
            make.width.equalTo(UIConstants.viewWidth)
            make.top.bottom.equalToSuperview()
        }
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(UIConstants.productImageHeight)
        }
        let productTitleStack = UIStackView()
        productTitleStack.axis = .vertical
        productTitleStack.addArrangedSubview(title)
        productTitleStack.addArrangedSubview(subTitle)
        view.addSubview(productTitleStack)
        productTitleStack.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(UIConstants.insertOffset)
            make.centerX.equalTo(image)
            make.leading.trailing.equalToSuperview().inset(UIConstants.insertOffset)
        }
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(productTitleStack.snp.bottom).offset(UIConstants.insertOffset)
            make.leading.trailing.equalToSuperview().inset(UIConstants.insertOffset)
            make.bottom.equalToSuperview().inset(UIConstants.insertOffset)
        }
        
        //MARK: - AddToCartBtnAction
        makeSystem(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        buttonAction?(item.productId)
    }
}

