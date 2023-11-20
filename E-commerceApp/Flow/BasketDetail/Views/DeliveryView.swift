//
//  DeliveryView.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 31.10.2023.
//

import UIKit

class DeliveryView: BaseView {
    //MARK: - Private Properties
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Delivery to"
        label.font = Resources.Fonts.helveticaRegular(with: 12)
        label.textColor = .black
        return label
    }()
    private var deliveryAddressBtn = DeliveryAddressButton()
}

extension DeliveryView {
    override func setupViews() {
        super.setupViews()
        addSubview(title)
        addSubview(deliveryAddressBtn)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        deliveryAddressBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalTo(title)
        }
        addSeparator(is: true)
        addSeparator(is: false)
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        deliveryAddressBtn.setTitle("Almaty Al-farabi 15 k4v 412")
    }
}
