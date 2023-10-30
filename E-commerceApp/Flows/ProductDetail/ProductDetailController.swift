//
//  ProductDetailController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 27.10.2023.
//

import UIKit

class ProductDetailController: BaseController {
    //MARK: - Public
    func configure(with model: HomeProductListItemModel) {
        item.append(.productDetail(model))
        getMarketInfo(with: model.id)
        item.append(.productDiscription)
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navBar.delegate = self
        navBar.configure(with: "Details Product")
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var item: [ProductDetailModel] = []
    private let navBar = ProductDetailNavBar()
    
}

extension ProductDetailController: SecondNavigationBar {
    func didBackBtnAction() {
        navigationController?.popViewController(animated: true)
    }
}

private extension ProductDetailController {
    func setupTableView() {
        view.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.register(ProductDetailCell.self, forCellReuseIdentifier: String(describing: ProductDetailCell.self))
        tableView.register(MarketDetailCell.self, forCellReuseIdentifier: String(describing: MarketDetailCell.self))
        tableView.register(DiscriptCell.self, forCellReuseIdentifier: String(describing: DiscriptCell.self))
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.trailing.leading.bottom.equalToSuperview()
        }
        tableView.separatorColor = Resources.Colors.secondary
        tableView.allowsSelection = false
    }
    
    func getMarketInfo(with id: Int) {
        let data = MarketData.item
        for i in data {
            if i.id == id {
                item.append(.marketDetail(i))
            } else {
                continue
            }
        }
    }
}

extension ProductDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = item[indexPath.row]
        switch item {
        case .productDetail(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailCell.self), for: indexPath) as! ProductDetailCell
            cell.configure(wiht: model)
            return cell
        case .marketDetail(let market):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MarketDetailCell.self), for: indexPath) as! MarketDetailCell
            cell.configure(with: market)
            return cell
        case .productDiscription:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DiscriptCell.self), for: indexPath) as! DiscriptCell
            cell.configure() // moc 
            return cell
        }
    }
}

