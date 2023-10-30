//
//  BasketVC.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 23.10.2023.
//

import UIKit

class BasketVC: BaseController {
    
    //MARK: - Private Properties
    private let navBar = GeneralNavigationBar()
    private let deliveryView = DeliveryView()
}

extension BasketVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
        view.addSubview(deliveryView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        deliveryView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navBar.configure(with: "Your Cart")
        navBar.delegate = self
        navBar.rightBtnImage(isNotification: true)
    }
}

//MARK: - GeneralNavigationBarDelegate
extension BasketVC: GeneralNavigationBarDelegate {
    func didBackBtnAction() {
        navigationController?.popViewController(animated: true)
    }
}
