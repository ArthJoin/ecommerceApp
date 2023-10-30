//
//  DeliveryAddressButton.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 13.10.2023.
//

import UIKit

final class DeliveryAddressButton: UIButton {
    //MARK: - Public
    func setTitle(_ title: String) {
        deliveryAddress.text = title
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Properties
    private let deliveryAddress: UILabel = {
        let label = UILabel()
        label.textColor =  Resources.Colors.titleMain
        label.font = Resources.Fonts.helveticaRegular(with: 12)
        return label
    }()
    private let downArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.down")
        image.tintColor = Resources.Colors.commonIcon
        return image
    }()
}

private extension DeliveryAddressButton {
    func configure() {
        backgroundColor = .white
        makeSystem(self)
        addSubview(deliveryAddress)
        deliveryAddress.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
        addSubview(downArrow)
        downArrow.snp.makeConstraints { make in
            make.leading.equalTo(deliveryAddress.snp.trailing).offset(5)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(10)
        }
    }
}
