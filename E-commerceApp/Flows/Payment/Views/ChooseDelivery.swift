//
//  ChooseDelivery.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 09.11.2023.
//

import UIKit

struct DeliveryTypeItem {
    var title: String
    var deliveryTime: String
    var deliveryPrice: String
}

protocol ChooseDeliveryDelegate: AnyObject {
    func didDeliveryTypeBtnTapped(with delivery: DeliveryTypeItem)
}

final class ChooseDelivery: BaseController {
    weak var delegate: ChooseDeliveryDelegate?
    
    private let header: UILabel = {
        let label = UILabel()
        label.text = "Select the delivery"
        label.font = Resources.Fonts.systemWeight(with: 17, weight: .medium)
        return label
    }()
    private let closeBtn: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        if let systemImage = UIImage(systemName: "xmark") {
            let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 15, weight: .regular))
            btn.setImage(resizedImage, for: .normal)
        }
        return btn
    }()
    private let stack = UIStackView()
    private let deliveryType: [DeliveryTypeItem] = [
        .init(title: "Express", deliveryTime: "1-3 days delivery", deliveryPrice: "$14.99"),
        .init(title: "Regular", deliveryTime: "2-4 days delivery", deliveryPrice: "$7.99"),
        .init(title: "Cargo", deliveryTime: "7-14 days delivery", deliveryPrice: "$2.99")
    ]
    private let tableView = UITableView()
}

extension ChooseDelivery {
    override func setupViews() {
        super.setupViews()
        view.addSubview(stack)
        view.addSubview(tableView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        stack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stack.snp.bottom).offset(15)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.layer.cornerRadius = 24
        stack.axis = .horizontal
        stack.addArrangedSubview(header)
        stack.addArrangedSubview(closeBtn)
        stack.alignment = .center
        stack.distribution = .equalSpacing
        tableView.separatorColor = .clear
        tableView.register(ChooseDeliveryCell.self, forCellReuseIdentifier: String(describing: ChooseDeliveryCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        
        closeBtn.addTarget(self, action: #selector(closeBtnHandler), for: .touchUpInside)
    }
    
    @objc func closeBtnHandler() {
        self.dismiss(animated: true)
    }
}

//MARK: - UITableViewDataSource
extension ChooseDelivery: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        deliveryType.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChooseDeliveryCell.self), for: indexPath) as! ChooseDeliveryCell
        cell.configure(with: deliveryType[indexPath.row])
        let view = UIView()
        view.backgroundColor = .white
        cell.selectedBackgroundView = view
        return cell
    }
}

extension ChooseDelivery: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delivery = deliveryType[indexPath.row]
        delegate?.didDeliveryTypeBtnTapped(with: delivery)
        self.dismiss(animated: true)
    }
}
