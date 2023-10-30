//
//  HomeNavBar.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 13.10.2023.
//

import UIKit

final class HomeNavBar: BaseView {
    
    private let deliveryAddressButton = DeliveryAddressButton()
    private let notificationButton = UIButton()
    private let basketButton = UIButton()
    
    private let searchView = HomeSearchBar()
}

extension HomeNavBar {
    override func setupViews() {
        super.setupViews()
        addView(deliveryAddressButton)
        addView(notificationButton)
        addView(basketButton)
        addView(searchView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            deliveryAddressButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            deliveryAddressButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            
            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            notificationButton.centerYAnchor.constraint(equalTo: deliveryAddressButton.centerYAnchor),
            
            basketButton.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor,constant: -10),
            basketButton.centerYAnchor.constraint(equalTo: notificationButton.centerYAnchor),
            
            searchView.topAnchor.constraint(equalTo: basketButton.bottomAnchor, constant: 15),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            searchView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        
        backgroundColor = .white
        deliveryAddressButton.setTitle("Almaty Al-farabi 15 k4v 412")        
        notificationButton.setImage(Resources.Images.common.notififcation, for: .normal)
        basketButton.setImage(Resources.Images.common.basket, for: .normal)
        
        
        searchView.layer.borderColor = Resources.Colors.transpulentGray.cgColor
        searchView.layer.borderWidth = 1
        searchView.layer.cornerRadius = 7
        
        basketButton.addTarget(self, action: #selector(basketButtonAction), for: .touchUpInside)
    }
}

extension HomeNavBar {
    @objc func basketButtonAction() {
    }
}
