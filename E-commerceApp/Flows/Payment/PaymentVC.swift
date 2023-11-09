//
//  PaymentVC.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 09.11.2023.
//

import UIKit

class PaymentVC: BaseController {
    //MARK: - Public
    func configure() {
        let productList = MocNetworkManager.shared.getPaymentProductList()
        if !productList.isEmpty {
            checkoutItems.append(.productList(productList))
            checkoutItems.append(.deliveryType)
            checkoutItems.append(.paymentMethod)
        } else {
            checkoutItems.append(.deliveryType)
            checkoutItems.append(.paymentMethod)
        }
        footer.configure()
        footer.changeBtnText(with: "Pay!")
    }
    
    //MARK: - Private Properties
    private var checkoutItems: [CheckoutItemModel] = []
    private let generalNavigationBar = GeneralNavigationBar()
    private let tableView = UITableView()
    private var footer = OrderSummaryView()
//    private let transition 
}

//MARK: - Lifecycle methods
extension PaymentVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(generalNavigationBar)
        view.addSubview(tableView)
        view.addSubview(footer)
    }
    
    override func constaintViews() {
        super.constaintViews()
        generalNavigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(generalNavigationBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        footer.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    override func configureAppearance() {
        super.configureAppearance()
        tableView.separatorColor = .clear
        tableView.register(PaymentListCell.self, forCellReuseIdentifier: String(describing: PaymentListCell.self))
        tableView.register(DeliveryTypeCell.self, forCellReuseIdentifier: String(describing: DeliveryTypeCell.self))
        tableView.register(PaymentMethodCell.self, forCellReuseIdentifier: String(describing: PaymentMethodCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        
        generalNavigationBar.delegate = self
        generalNavigationBar.configure(with: "Checkout")
        generalNavigationBar.rightBtnIsHidden(true)
    }
}

//MARK: - Navigation Bar Delegate
extension PaymentVC: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
        navigationController?.popViewController(animated: true)
    }
    
    func rightBtnAction() {}
}

//MARK: - UITableViewDataSource
extension PaymentVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkoutItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = checkoutItems[indexPath.row]
        let view = UIView()
        view.backgroundColor = .clear
        switch cellType {
        case .productList(let product):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PaymentListCell.self), for: indexPath) as! PaymentListCell
            cell.configure(with: product[indexPath.row])
            cell.selectedBackgroundView = view
            return cell
        case .deliveryType:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DeliveryTypeCell.self), for: indexPath) as! DeliveryTypeCell
            cell.selectedBackgroundView = view
            return cell
        case .paymentMethod:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PaymentMethodCell.self), for: indexPath)
            cell.selectedBackgroundView = view
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = checkoutItems[indexPath.row]
        switch cellType {
        case .productList(_):
            print("productList")
        case .deliveryType:
            let secondVC = ChooseDelivery()
            secondVC.modalPresentationStyle = .custom
            secondVC.transitioningDelegate = transition
            self.present(secondVC, animated: true)
        case .paymentMethod:
            print("keep working")
        }
    }
}
