//
//  ProductDetailNavBar.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 30.10.2023.
//

import UIKit

protocol GeneralNavigationBarDelegate: AnyObject {
    func didBackBtnActionEnableTabBar()
    func rightBtnAction()
}

class GeneralNavigationBar: BaseView {
    //MARK: - Public
    func configure(with text: String) {
        title.text = text
    }
    func textAlignment(isCenter alignment: Bool) {
        if alignment {
            title.textAlignment = .center
        }
    }
    func rightBtnIsHidden(_ ans: Bool) {
        rightBtn.isHidden = ans
    }
    func rightBtnImage(isNotification: Bool) {
        rightBtn.setImage(Resources.Images.common.notififcation, for: .normal)
    }
    func backBtn(isHidden ans: Bool) {
        backBtn.isHidden = ans 
    }
    weak var delegate: GeneralNavigationBarDelegate?
    
    //MARK: - Private Properties
    private let title: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        return label
    }()
    private let rightBtn: UIButton = {
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

//MARK: - Lifecycle methods
extension GeneralNavigationBar {
    override func setupViews() {
        super.setupViews()
        addSubview(title)
        addSubview(rightBtn)
        addSubview(backBtn)
    }
    override func constaintViews() {
        super.constaintViews()
        title.snp.makeConstraints { make in
            make.trailing.equalTo(rightBtn.snp.leading)
            make.leading.equalTo(backBtn.snp.trailing).offset(20)
            make.top.bottom.equalToSuperview().inset(20)
        }
        rightBtn.snp.makeConstraints { make in
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
        makeSystem(backBtn)
        makeSystem(rightBtn)
        backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
    }
}

//MARK: - Private Methods
extension GeneralNavigationBar {
    @objc func backBtnAction() {
        delegate?.didBackBtnActionEnableTabBar()
    }
    @objc func rightBtnAction() {
        delegate?.rightBtnAction()
    }
}
