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
    private let tableView = UITableView()
    private var item: [HomeProductListItemModel] = []
    private var productId = ProductDetailCell()
}

extension BasketVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
        view.addSubview(deliveryView)
        view.addSubview(tableView)
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
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        tabBarController?.tabBar.isHidden = true
        navBar.configure(with: "Your Cart")
        navBar.delegate = self
        navBar.rightBtnImage(isNotification: true)
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(BasketTableCell.self, forCellReuseIdentifier: String(describing: BasketTableCell.self))
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        productId.delegate = self
    }
}

//MARK: - AddProductToBasketDelegate
extension BasketVC: ProductDetailCellDelegate {
    func didAddToCardWithProductId(with productId: Int) {
        item.append(MocNetworkManager.shared.addProductWithId(with: productId))
    }
}

//MARK: - GeneralNavigationBarDelegate
extension BasketVC: GeneralNavigationBarDelegate {
    func rightBtnAction() {
    }
    func didBackBtnActionEnableTabBar() {
        navigationController?.popViewController(animated: true)
        if navigationController?.viewControllers.count == 1 {
            tabBarController?.tabBar.isHidden = false
        }
    }
}

//MARK: - UITableViewDataSource
extension BasketVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketTableCell.self), for: indexPath) as! BasketTableCell
        cell.configure(with: item[indexPath.row])
        return cell
    }
}
