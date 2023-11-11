//
//  AddNewCardController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.11.2023.
//

import UIKit

final class AddNewCardController: BaseController {
    private let navBar = GeneralNavigationBar()
    private let cardData = CardDataView()
    private let doneBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Done!", for: .normal)
        btn.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 14)
        btn.backgroundColor = Resources.Colors.active
        btn.layer.cornerRadius = 5
        return btn
    }()
}

extension AddNewCardController {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
        view.addSubview(cardData)
        view.addSubview(doneBtn)
    }
    
    override func constaintViews() {
        super.constaintViews()
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        cardData.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        doneBtn.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navBar.configure(with: "Payment method")
        navBar.rightBtnIsHidden(true)
        navBar.delegate = self
    }
}

extension AddNewCardController: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
        navigationController?.popViewController(animated: true)
    }
    
    func rightBtnAction() {
    }
}

