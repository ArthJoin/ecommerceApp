//
//  ProductDetailNavBar.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 30.10.2023.
//

import UIKit

protocol SecondNavigationBar: AnyObject {
    func didBackBtnAction()
}

class ProductDetailNavBar: BaseView {
    //MARK: - Public
    func configure(with text: String) {
        title.text = text
    }
    weak var delegate: SecondNavigationBar?
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        return label
    }()
    private let basket: UIButton = {
        let btn = UIButton()
        btn.setImage(Resources.Images.common.basket, for: .normal)
        return btn
    }()
    private let backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        btn.tintColor = .black
        return btn
    }()
}

extension ProductDetailNavBar {
    override func setupViews() {
        super.setupViews()
        addSubview(title)
        addSubview(basket)
        addSubview(backBtn)
    }
    override func constaintViews() {
        super.constaintViews()
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(20)
        }
        basket.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(title)
        }
        backBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalTo(title)
        }
    }
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
        backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        makeSystem(backBtn)
    }
}

//MARK: - Private Method
extension ProductDetailNavBar {
    @objc func backBtnAction() {
        delegate?.didBackBtnAction()
    }
}
