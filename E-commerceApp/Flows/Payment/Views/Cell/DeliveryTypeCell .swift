//
//  DeliveryTypeCell .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 09.11.2023.
//

import UIKit

final class DeliveryTypeCell: UITableViewCell {
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
        view.layer.borderWidth = 1
        view.layer.borderColor = Resources.Colors.transpulentGray.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    private var text: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 15)
        label.textColor = Resources.Colors.titleMain
        return label
    }()
    
    private let btn: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        if let sysImage = UIImage(systemName: "chevron.right") {
            let resizedImage = sysImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 10, weight: .regular))
            btn.setImage(resizedImage, for: .normal)
        }
        return btn
    }()
}

//MARK: - Private Methods
private extension DeliveryTypeCell {
    func initialize() {
        addSeparator()
        addSubview(view)
        view.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(45)
        }
        view.addSubview(text)
        text.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(5)
        }
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(text)
        }
    }
    
    func addSeparator() {
        let separator = UIView()
        separator.backgroundColor = Resources.Colors.transpulentGray
        self.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
