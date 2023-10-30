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
    private let navBar = HomeNavBar()
    private let tableView = UITableView()
    private let items: [HomeItemType] = [
        .banner([
            HomeBannerItemModel(image: DummyData.banner.first!),
            HomeBannerItemModel(image: DummyData.banner.first!),
            HomeBannerItemModel(image: DummyData.banner.first!)
        ]),
        .category([
            HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
            HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
            HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
            HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
            HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
        ]),
        .productList([
            HomeProductListItemModel(id: 0, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 1, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 2, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 3, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 4, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 5, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 6, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
            HomeProductListItemModel(id: 7, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle)
        ])
    ]

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
        navigationController?.navigationBar.isHidden = true
        tableView.dataSource = self
        tableView.register(HomeBannerCell.self, forCellReuseIdentifier: String(describing: HomeBannerCell.self))
        tableView.register(HomeCategoryCell.self, forCellReuseIdentifier: String(describing: HomeCategoryCell.self))
        tableView.register(HomeProductListCell.self, forCellReuseIdentifier: String(describing: HomeProductListCell.self))
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        
        //
        
        
        
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
        case .productList(let product):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeProductListCell.self), for: indexPath) as! HomeProductListCell
            cell.configure(with: product)
            cell.delegate = self
            return cell
        }
    }
}

extension HomeController: HomeProductListCellDelegate {
    func didSelectItem(with id: HomeProductListItemModel) {
        let secondViewController = ProductDetailController()
        secondViewController.configure(with: id)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}


