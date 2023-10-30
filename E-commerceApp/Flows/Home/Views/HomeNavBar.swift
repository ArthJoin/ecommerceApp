//
//  HomeNavBar.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 13.10.2023.
//

import UIKit

protocol BasketBtnDelegate: AnyObject {
    func didBasketAction()
}

final class HomeNavBar: UIView {
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        Initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Properies
    private let deliveryAddressButton = DeliveryAddressButton()
    private let searchView = HomeSearchBar()
    weak var delegate: BasketBtnDelegate?
    
    private let notificationButton: UIButton = {
        let btn = UIButton()
        btn.setImage(Resources.Images.common.notififcation, for: .normal)
        return btn
    }()
    
    private let basketButton: UIButton = {
        let btn = UIButton()
        btn.setImage(Resources.Images.common.basket, for: .normal)
        return btn
    }()
    
    private let deliveryBtnTitle: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.home.deliveryAddressButton
        label.textColor = Resources.Colors.secondary
        label.font = Resources.Fonts.helveticaRegular(with: 10)
        return label
    }()
}

extension HomeNavBar {
   func Initialize() {
       backgroundColor = .white
       deliveryAddressButton.setTitle("Almaty Al-farabi 15 k4v 412")
       let stack = UIStackView()
       stack.axis = .vertical
       stack.addArrangedSubview(deliveryBtnTitle)
       stack.addArrangedSubview(deliveryAddressButton)
       addSubview(stack)
       stack.snp.makeConstraints { make in
           make.top.equalToSuperview().inset(5)
           make.leading.equalToSuperview().inset(20)
       }
       addSubview(notificationButton)
       notificationButton.snp.makeConstraints { make in
           make.trailing.equalToSuperview().inset(20)
           make.centerY.equalTo(stack)
       }
       addSubview(basketButton)
       basketButton.snp.makeConstraints { make in
           make.trailing.equalTo(notificationButton.snp.leading).inset(-10)
           make.centerY.equalTo(stack)
       }
       searchView.layer.borderColor = Resources.Colors.transpulentGray.cgColor
       searchView.layer.borderWidth = 1
       searchView.layer.cornerRadius = 7
       addSubview(searchView)
       searchView.snp.makeConstraints { make in
           make.top.equalTo(stack.snp.bottom).offset(15)
           make.leading.trailing.equalToSuperview().inset(15)
           make.bottom.equalToSuperview().inset(10)
           make.height.equalTo(45)
       }
       basketButton.addTarget(self, action: #selector(basketButtonAction), for: .touchUpInside)
    }
}

extension HomeNavBar {
    @objc func basketButtonAction() {
        delegate?.didBasketAction()
    }
}
