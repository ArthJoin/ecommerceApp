//
//  DeliveryAddressCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 25.11.2023.
//

import UIKit

final class DeliveryAddressCell: UITableViewCell {
    //MARK: - Public
    func configure() {
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        constaintViews()
        configureAppearance()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    //MARK: - Private properties
    private let addressIcon: UIImageView = {
        let image = UIImageView()
        if let sysImage = UIImage(systemName: "location.north.circle.fill") {
            let resizedImage = sysImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
            image.image = resizedImage
        }
        image.tintColor = .black
        return image
    }()
    private let addresLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    private let stack = UIStackView()
}

extension DeliveryAddressCell {
    func setupViews() {
        contentView.addSubview(stack)
    }
    func constaintViews() {
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configureAppearance() {
        stack.axis = .horizontal
        stack.addArrangedSubview(addressIcon)
        stack.addArrangedSubview(addresLabel)
        stack.distribution = .fillProportionally
    }
}
