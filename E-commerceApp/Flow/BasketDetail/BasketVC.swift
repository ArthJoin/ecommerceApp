//
//  BasketVC.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 23.10.2023.
//

import UIKit

class BasketVC: BaseController {
    //MARK: - Public
    func configure(with productList: [ProductListItemModel]) {
        self.productList = productList
        tableView.reloadData()
    }
    
    //MARK: - Private Properties
    private var productList: [ProductListItemModel] = []
    private let navBar = GeneralNavigationBar()
    private let deliveryView = DeliveryAddresView()
    private let tableView = UITableView()
    private let footer = BasketFooterView()
}

extension BasketVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
        view.addSubview(deliveryView)
        view.addSubview(tableView)
        view.addSubview(footer)
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
        tableView.snp.makeConstraints { make in
            make.top.equalTo(deliveryView.snp.bottom)
            make.trailing.leading.equalToSuperview()
        }
        footer.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        tableView.register(BasketTableCell.self, forCellReuseIdentifier: String(describing: BasketTableCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorColor = .clear
        
        tabBarController?.tabBar.isHidden = true
        navBar.configure(with: "Your Cart")
        navBar.delegate = self
        navBar.rightBtnImage(isNotification: true)
        
        footer.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension BasketVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketTableCell.self), for: indexPath) as! BasketTableCell
        cell.configure(with: productList[indexPath.row])
        cell.changePrice = {
            self.footer.configure()
        }
        footer.configure()
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Remove from DB
            MocNetworkManager.shared.removeBasketPrice(with: productList[indexPath.row].subTitle)
            footer.configure()
            MocNetworkManager.shared.putProductListRemoveBasket(with: productList[indexPath.row].productId)
            //Remove from self array
            productList.remove(at: indexPath.row)
            MocNetworkManager.shared.deleteProductFromBasket(with: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = ProductDetailController()
        secondVC.configure(with: productList[indexPath.row].productId)
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

//MARK: - GeneralNavigationBarDelegate
extension BasketVC: GeneralNavigationBarDelegate {
    func rightBtnAction() {
    }
    func didBackBtnActionEnableTabBar() {
        MocNetworkManager.shared.selectedBasketPrice = 0
        MocNetworkManager.shared.paymentProductList.removeAll()
        navigationController?.popViewController(animated: true)
        if navigationController?.viewControllers.count == 1 {
            tabBarController?.tabBar.isHidden = false
        }
    }
}

//MARK: - PaymentMethodBtn Delegate
extension BasketVC: BasketFooterViewDelegate {
    func didPaymentMethodBtnTapped() {
        let secondVC = PaymentVC()
        secondVC.configure()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

