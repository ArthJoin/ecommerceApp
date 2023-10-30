//
//  MarketDetailCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 30.10.2023.
//

import UIKit

class MarketDetailCell: UITableViewCell {
    //MARK: - Public
    func configure() {
        
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Constants
    private enum UIConstants {
        static let logoSize: CGFloat = 40
    }
    
    
    //MARK: - Private Properties
    private var marketLogo: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = UIConstants.logoSize / 2
        return image
    }()
    
    private var marketName: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private var marketOnline: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 12)
        label.textColor = Resources.Colors.secondary
        return label
    }()
    
    private let followBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Follow", for: .normal)
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = Resources.Colors.backgroundElement.cgColor
        btn.layer.cornerRadius = 5
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
}

//MARK: - Private method
extension MarketDetailCell {
    func initialize() {
        contentView.addSubview(marketLogo)
        marketLogo.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
        }
    }
}
