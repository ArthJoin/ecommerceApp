//
//  WishlistTableCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 02.11.2023.
//

import UIKit

final class WishlistTableCell: UITableViewCell {
    //MARK: - Public
    func configure(with item: HomeProductListItemModel) {
        productImage.image = item.image
        productName.text = item.title
        productPrice.text = item.subTitle
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
    private let chekbox: UIButton = {
        let btn = UIButton()
        if let systemImage = UIImage(systemName: "app") {
            let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
            btn.setImage(resizedImage, for: .normal)
        }
        btn.tintColor = Resources.Colors.secondary
        return btn
    }()
    
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
        label.text = DummyData.products.subTitle
        return label
    }()
}

//MARK: - Private Methods
extension WishlistTableCell {
    func initialize() {
        contentView.addSubview(chekbox)
        chekbox.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.bottom.equalToSuperview()
        }
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.leading.equalTo(chekbox.snp.trailing).offset(15)
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
        //
        
        chekbox.addTarget(self, action: #selector(chekboxTapped), for: .touchUpInside)
    }
}

extension WishlistTableCell {
    @objc func chekboxTapped() {
        if chekbox.isSelected {
            UIView.animate(withDuration: 0.2) {
                if let sysImage = UIImage(systemName: "app") {
                    let resizedImage = sysImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
                    self.chekbox.setImage(resizedImage, for: .normal)
                }
                self.chekbox.tintColor = Resources.Colors.secondary
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                if let sysImage = UIImage(systemName: "checkmark.square.fill") {
                    let resizedImage = sysImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
                    self.chekbox.setImage(resizedImage, for: .normal)
                }
                self.chekbox.tintColor = Resources.Colors.active
            }
        }
        chekbox.isSelected = !chekbox.isSelected
    }
}
