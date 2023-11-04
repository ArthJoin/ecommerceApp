//
//  MarketDetailCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 30.10.2023.
//

import UIKit

final class MarketDetailCell: UITableViewCell {
    //MARK: - Public
    func configure(with model: MarketInfoModel) {
        marketLogo.image = model.image
        marketName.text = model.marketName
        marketOnline.text = model.marketLastOnline
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
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
        btn.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 12)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Resources.Colors.secondary.cgColor
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
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(15)
            make.size.equalTo(UIConstants.logoSize)
        }
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(marketName)
        stack.addArrangedSubview(marketOnline)
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerY.equalTo(marketLogo)
            make.leading.equalTo(marketLogo.snp.trailing).offset(10)
        }
        contentView.addSubview(followBtn)
        followBtn.snp.makeConstraints { make in
            make.centerY.equalTo(marketLogo)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
    }
}
