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
    let emptyStateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .red
        imageView.alpha = 0.6
        imageView.contentMode = .center
        if let systemImage = UIImage(systemName: "heart.slash.fill") {
            let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 60, weight: .regular))
            imageView.image = resizedImage
        }
        return imageView
    }()
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
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
        if item.isEmpty {
            tableView.backgroundView = emptyStateImageView
        } else {
            tableView.backgroundView = nil
        }
        tableView.reloadData()
    }
}

//MARK: - GeneralNavigationBarDelegate
extension WishlistController: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
    }
    func rightBtnAction() {
        let secondVC = BasketVC()
        let productList = MocNetworkManager.shared.getBasketProductList()
        secondVC.configure(with: productList)
        navigationController?.pushViewController(secondVC, animated: true)
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
