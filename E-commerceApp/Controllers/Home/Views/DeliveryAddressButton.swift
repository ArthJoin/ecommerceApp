//
//  DeliveryAddressButton.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 13.10.2023.
//

import UIKit

final class DeliveryAddressButton: UIButton {
    
    private let title = UILabel()
    private let label = UILabel()
    private let iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension DeliveryAddressButton {
    func addViews() {
        addView(title)
        addView(label)
        addView(iconView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            iconView.heightAnchor.constraint(equalToConstant: 12),
            iconView.widthAnchor.constraint(equalToConstant: 12),
            
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -7),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 1),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            
        ])
    }
    
    func configure() {
        backgroundColor = .white
        makeSystem(self)
        
        title.textColor = Resources.Colors.secondary
        title.text = Resources.Strings.home.deliveryAddressButton
        title.font = Resources.Fonts.helveticaRegular(with: 10)
        
        label.textColor = Resources.Colors.titleGray
        label.font = Resources.Fonts.helveticaRegular(with: 12)
        
        iconView.image = Resources.Images.common.downArrow
        iconView.tintColor = Resources.Colors.commonIcon
    }
}
