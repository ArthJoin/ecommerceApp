//
//  WishlistController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 12.10.2023.
//

import UIKit

class WishlistController: BaseController {
    //MARK: - Private Properties
    private var item = MocNetworkManager.shared.getWishlistProductList()
    private let navBar = GeneralNavigationBar()
    private let tableView = UITableView()
}

//MARK: - Lifecycle methods
extension WishlistController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
        view.addSubview(tableView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        // Navigation bar
        navigationController?.navigationBar.isHidden = true
        navBar.configure(with: "Wishlist")
        navBar.backBtn(isHidden: true)
        navBar.delegate = self
        // TableView
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WishlistTableCell.self, forCellReuseIdentifier: String(describing: WishlistTableCell.self))
    }
    
    override func fetchData() {
        super.fetchData()
        item = MocNetworkManager.shared.getWishlistProductList()
        tableView.reloadData()
    }
}

//MARK: - GeneralNavigationBarDelegate
extension WishlistController: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
    }
    func rightBtnAction() {
        navigationController?.pushViewController(BasketVC(), animated: true)
        tabBarController?.tabBar.isHidden = true
    }
}

//MARK: - UITableViewDataSource
extension WishlistController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WishlistTableCell.self), for: indexPath) as! WishlistTableCell
        cell.configure(with: item[indexPath.row])
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = ProductDetailController()
        secondVC.configure(with: item[indexPath.row].productId)
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
