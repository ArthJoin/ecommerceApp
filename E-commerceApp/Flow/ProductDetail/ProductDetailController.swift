//
//  ProductDetailController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 27.10.2023.
//

import UIKit

class ProductDetailController: BaseController {
    //MARK: - Public
    func configure(with productId: Int) {
        let product = MocNetworkManager.shared.getProductById(with: productId)
        self.productDetail = product
        self.product.append(.productDetail(product))
        self.product.append(.marketDetail(MocNetworkManager.shared.getMarketInfo(with: product.marketId)))
        self.product.append(.productDiscription)
        tableView.reloadData()
    }
    
    //MARK: - Private UIConstants
    private enum UIConstant {
        static let navBarTitle: String = "Details Product"
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var product: [ProductDetailItemType] = []
    private var productDetail: ProductListItemModel?
    private let navBar = GeneralNavigationBar()
    private let footer = FooterProductDetail()
}

//MARK: - GeneralNavigationBarDelegate
extension ProductDetailController: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
        navigationController?.popViewController(animated: true)
        if navigationController?.viewControllers.count == 1 {
            tabBarController?.tabBar.isHidden = false
        }
    }
    func rightBtnAction() {
        let secondVC = BasketVC()
        let productList = MocNetworkManager.shared.getBasketProductList()
        secondVC.configure(with: productList)
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

//MARK:
extension ProductDetailController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
        view.addSubview(tableView)
        view.addSubview(footer)
    }
    
    override func constaintViews() {
        super.constaintViews()
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
        }
        footer.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(footer.snp.top)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        tabBarController?.tabBar.isHidden = true
        
        navBar.delegate = self
        navBar.configure(with: UIConstant.navBarTitle)
        navBar.textAlignment(isCenter: true)
        
        guard let productDetail = productDetail else { return }
        footer.configure(with: productDetail.productId)
        
        tableView.register(ProductDetailCell.self, forCellReuseIdentifier: String(describing: ProductDetailCell.self))
        tableView.register(MarketDetailCell.self, forCellReuseIdentifier: String(describing: MarketDetailCell.self))
        tableView.register(DiscriptCell.self, forCellReuseIdentifier: String(describing: DiscriptCell.self))
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
    }
    
    override func fetchData() {
        super.fetchData()
        guard let productDetail = productDetail else { return }
        footer.configure(with: productDetail.productId)
    }
}

//MARK: - UITableViewDataSource
extension ProductDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = product[indexPath.row]
        switch item {
        case .productDetail(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailCell.self), for: indexPath) as! ProductDetailCell
            cell.configure(with: model.productId)
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

