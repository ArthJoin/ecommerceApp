//
//  DeliveryAddressVC.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 24.11.2023.
//

import UIKit

final class DeliveryAddressVC: BaseController {
    //MARK: - Private Properties
    private let header: UILabel = {
        let label = UILabel()
        label.text = "Your location?"
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
    private let headerStack = UIStackView()
    private let tableView = UITableView()
}

extension DeliveryAddressVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(headerStack)
    }
    override func constaintViews() {
        super.constaintViews()
        headerStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    override func configureAppearance() {
        super.configureAppearance()
        view.layer.cornerRadius = 25
        headerStack.axis = .horizontal
        headerStack.addArrangedSubview(header)
        headerStack.addArrangedSubview(closeBtn)
        headerStack.alignment = .center
        headerStack.distribution = .equalSpacing
        
        tableView.dataSource = self
        tableView.register(DeliveryAddressCell.self, forCellReuseIdentifier: String(describing: DeliveryAddressCell.self))
    }
}

extension DeliveryAddressVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DeliveryAddressCell.self), for: indexPath) as! DeliveryAddressCell
        return cell
    }
}
