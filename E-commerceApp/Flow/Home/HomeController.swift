//
//  ViewController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.10.2023.
//

import UIKit
import SnapKit

class HomeController: BaseController {
    //MARK: - Private properties
    private let navBar = MainNavigationBar()
    private let tableView = UITableView()
    private let transition = PanelTransition()
    private var items: [HomeItemType] = MocNetworkManager.shared.getHomeDB()
}

extension HomeController {
    //MARK: - View Lifecycle funcs
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
        //NavigationBar
        navigationController?.navigationBar.isHidden = true
        navBar.delegate = self
        
        //TableView
        tableView.dataSource = self
        tableView.register(HomeBannerCell.self, forCellReuseIdentifier: String(describing: HomeBannerCell.self))
        tableView.register(HomeCategoryCell.self, forCellReuseIdentifier: String(describing: HomeCategoryCell.self))
        tableView.register(HomeProductListCell.self, forCellReuseIdentifier: String(describing: HomeProductListCell.self))
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
    }
}

//MARK: - UITableViewDataSource
extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .banner(let banner):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeBannerCell.self), for: indexPath) as! HomeBannerCell
            cell.configure(with: banner)
            return cell
        case .category(let category):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeCategoryCell.self), for: indexPath) as! HomeCategoryCell
            cell.configure(with: category)
            return cell
        case .productList:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeProductListCell.self), for: indexPath) as! HomeProductListCell
            cell.configure()
            cell.delegate = self
            return cell
        }
    }
}

//MARK: - HomeProductListCellDelegate
extension HomeController: HomeProductListCellDelegate {
    func didSelectItem(with id: Int) {
        let secondVC = ProductDetailController()
        secondVC.configure(with: id)
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

//MARK: - BasketBtnDelegate
extension HomeController: HomeNavBarDelegate {
    func deliveryAddressBtnTapped() {
        let secondVC = DeliveryAddressVC()
        secondVC.modalPresentationStyle = .custom
        secondVC.transitioningDelegate = transition
        
        self.present(secondVC, animated: true)
    }
    
    func didBasketAction() {
        let secondVC = BasketVC()
        let productList = MocNetworkManager.shared.getBasketProductList()
        secondVC.configure(with: productList)
        navigationController?.pushViewController(secondVC, animated: true)
        UIView.animate(withDuration: 0.3) {
            self.tabBarController?.tabBar.isHidden = true
        }
    }
}
