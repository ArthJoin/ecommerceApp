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
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var item: [ProductDetailModel] = []
    
}

private extension ProductDetailController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(ProductDetailCell.self, forCellReuseIdentifier: String(describing: ProductDetailCell.self))
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}

extension ProductDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = item[indexPath.row]
        switch item {
        case .productDetail(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailCell.self), for: indexPath) as! ProductDetailCell
            cell.configure(wiht: model)
            return cell
//        case .marketDetail: break
//        case .productDiscription: break
        }
    }
}

