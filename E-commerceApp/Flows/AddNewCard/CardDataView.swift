//
//  CardDataView.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.11.2023.
//

import UIKit

final class CardDataView: BaseView {
    private let cardNumber: UITextField = {
        let textField = UITextField()
        textField.font = Resources.Fonts.helveticaRegular(with: 14)
        textField.placeholder = "   Enter your card number ..."
        textField.layer.borderColor = Resources.Colors.secondary.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
}

extension CardDataView {
    override func setupViews() {
        super.setupViews()
        addSubview(cardNumber)
    }
    
    override func constaintViews() {
        super.constaintViews()
        cardNumber.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
    }
}
