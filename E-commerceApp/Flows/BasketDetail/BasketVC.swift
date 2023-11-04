//
//  BasketVC.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 23.10.2023.
//

import UIKit

class BasketVC: BaseController {
    //MARK: - Public
    func configure(with productList: [HomeProductListItemModel]) {
        self.productList = productList
        tableView.reloadData()
    }
    
    //MARK: - Private Properties
    private var productList: [HomeProductListItemModel] = []
    private let navBar = GeneralNavigationBar()
    private let deliveryView = DeliveryView()
    private let tableView = UITableView()
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
        tableView.register(BasketTableCell.self, forCellReuseIdentifier: String(describing: BasketTableCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorColor = .clear
        
        tabBarController?.tabBar.isHidden = true
        navBar.configure(with: "Your Cart")
        navBar.delegate = self
        navBar.rightBtnImage(isNotification: true)
    }
}

//MARK: - UITableViewDataSource
extension BasketVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(productList.count)
        return productList.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BasketTableCell.self), for: indexPath) as! BasketTableCell
        cell.configure(with: productList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            productList.remove(at: indexPath.row)
            MocNetworkManager.shared.deleteProductFromBasket(with: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
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


