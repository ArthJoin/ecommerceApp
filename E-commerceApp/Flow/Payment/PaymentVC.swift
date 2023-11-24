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
            for i in productList {
                checkoutItems.append(.productList(i))
            }
            checkoutItems.append(.deliveryType(DeliveryTypeItem(title: "", deliveryTime: "", deliveryPrice: "")))
            checkoutItems.append(.paymentMethod)
        } else {
            checkoutItems.append(.deliveryType(DeliveryTypeItem(title: "", deliveryTime: "", deliveryPrice: "")))
            checkoutItems.append(.paymentMethod)
        }
        footer.configure()
        footer.changeBtnText(with: "Pay!")
    }
    
    //MARK: - Private Properties
    private var checkoutItems: [CheckoutItemModel] = []
    private let generalNavigationBar = GeneralNavigationBar()
    private let tableView = UITableView()
    private var footer = BasketFooterView()
    private let transition = PanelTransition()
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

//MARK: - GeneralNavigationBarDelegate
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
            cell.configure(with: product)
            cell.selectedBackgroundView = view
            return cell
        case .deliveryType(let delivery):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DeliveryTypeCell.self), for: indexPath) as! DeliveryTypeCell
            cell.configure(with: delivery)
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
            let secondVC = ChooseDeliveryVC()
            secondVC.delegate = self
            secondVC.modalPresentationStyle = .custom
            secondVC.transitioningDelegate = transition
            self.present(secondVC, animated: true)
        case .paymentMethod:
            let secondVC = PaymentMethodVC()
            secondVC.modalPresentationStyle = .custom
            secondVC.transitioningDelegate = transition
            self.present(secondVC, animated: true)
        }
    }
}

//MARK: - ChooseDeliveryDelegate
extension PaymentVC: ChooseDeliveryDelegate {
    func didDeliveryTypeBtnTapped(with delivery: DeliveryTypeItem) {
        self.checkoutItems[checkoutItems.count-2] = .deliveryType(delivery)
        tableView.reloadData()
    }
}
