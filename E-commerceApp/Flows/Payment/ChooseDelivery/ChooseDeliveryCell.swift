//
//  ChooseDeliveryCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 09.11.2023.
//

import UIKit

final class ChooseDeliveryCell: UITableViewCell {
    //MARK: - Public
    func configure(with type: DeliveryTypeItem) {
        self.deliveryName.text = type.title
        self.deliveryTime.text = type.deliveryTime
        self.deliveryPrice.text = type.deliveryPrice
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Private Properties
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.backgroundElement
        view.layer.cornerRadius = 10
        return view
    }()
    private let deliveryName: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 14, weight: .medium)
        return label
    }()
    private let deliveryTime: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 12)
        label.textColor = Resources.Colors.titleMain
        return label
    }()
    private let deliveryPrice: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 12, weight: .medium)
        label.textColor = Resources.Colors.titleMain
        return label
    }()
}

extension ChooseDeliveryCell {
    func initialize() {
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(5)
        }
        let verticalNameTimeStack = UIStackView()
        verticalNameTimeStack.axis = .vertical
        verticalNameTimeStack.addArrangedSubview(deliveryName)
        verticalNameTimeStack.addArrangedSubview(deliveryTime)
        verticalNameTimeStack.spacing = 5
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.addArrangedSubview(verticalNameTimeStack)
        horizontalStack.addArrangedSubview(deliveryPrice)
        horizontalStack.alignment = .lastBaseline
        horizontalStack.distribution = .equalSpacing
        view.addSubview(horizontalStack)
        horizontalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
    }
}
