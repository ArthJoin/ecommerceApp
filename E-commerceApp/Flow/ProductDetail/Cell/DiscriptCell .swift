//
//  DiscriptCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 30.10.2023.
//

import UIKit

final class DiscriptCell: UITableViewCell {
    //MARK: - Public
    func configure() {
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Properties
    private let header: UILabel = {
        let label = UILabel()
        label.text = "Description of product"
        label.font = Resources.Fonts.systemWeight(with: 17, weight: .medium)
        return label
    }()
    
    private let prodDiscription: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 14)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non dolor nibh. Quisque tempus dapibus mauris, mollis cursus augue varius vel. Curabitur eget lacinia nunc, lobortis aliquam purus. Quisque eu mi leo. Duis ullamcorper vitae turpis sit amet aliquet. Morbi mattis sollicitudin magna, et bibendum diam porta id. Praesent sit amet ipsum id ex aliquet commodo vel pharetra lacus. Vestibulum finibus quis velit non luctus. Morbi interdum suscipit imperdiet. Aliquam mollis gravida accumsan. Maecenas a semper risus. Maecenas lobortis felis metus, et rutrum lorem tincidunt vel."
        label.textColor = Resources.Colors.titleMain
        label.numberOfLines = 0
        return label
    }()
}

//MARK: - Private method
private extension DiscriptCell {
    func initialize() {
        contentView.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview().offset(15)
        }
        contentView.addSubview(prodDiscription)
        prodDiscription.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(10)
            make.trailing.leading.bottom.equalToSuperview().inset(15)
        }
    }
}
