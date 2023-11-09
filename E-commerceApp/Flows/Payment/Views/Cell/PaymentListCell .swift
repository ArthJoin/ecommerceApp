//
//  PaymentListCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 09.11.2023.
//

import UIKit

final class PaymentListCell: UITableViewCell {
    //MARK: - Public
    func configure(with product: ProductListItemModel) {
        productImage.image = product.image
        productName.text = product.title
        productPrice.text = "$\(product.subTitle)"
        doublePrice = product.subTitle
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
        image.layer.cornerRadius = 5
        return image
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 12, weight: .medium)
        return label
    }()
    
    private var doublePrice: Double = 0.0
    
    private let productPrice: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        return label
    }()
}

//MARK: - Private Methods
extension PaymentListCell {
    func initialize() {
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
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
    }
}


