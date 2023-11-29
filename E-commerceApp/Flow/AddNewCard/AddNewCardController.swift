//
//  AddNewCardController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.11.2023.
//

import UIKit

final class AddNewCardController: BaseController {
    private let navBar = GeneralNavigationBar()
    private let verticalStack = UIStackView()
    private let horizontalStack = UIStackView()
    private let cardNumber = CardViewTextField()
    private let cardExpDate = CardViewTextField()
    private let cardCvv = CardViewTextField()
    private let cardHolder = CardViewTextField()
    
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
        view.addSubview(verticalStack)
        view.addSubview(doneBtn)
    }
    
    override func constaintViews() {
        super.constaintViews()
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        verticalStack.snp.makeConstraints { make in
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
        navBar.configure(with: "Add new payment method")
        navBar.rightBtnIsHidden(true)
        navBar.delegate = self
        
        cardNumber.configure(header: "Card number", placeholder: "Enter card num ...", isImage: false, textField: 0)
        cardExpDate.configure(header: "Exp date", placeholder: "mm/yy", textField: 1)
        cardCvv.configure(header: "Security code", placeholder: "cvv/csv", textField: 2)
        cardHolder.configure(header: "Card holder", placeholder: "Enter card holder name", textField: 3, keyboard: true)
        
        horizontalStack.axis = .horizontal
        horizontalStack.addArrangedSubview(cardExpDate)
        horizontalStack.addArrangedSubview(cardCvv)
        horizontalStack.distribution = .fillProportionally
        verticalStack.axis = .vertical
        verticalStack.addArrangedSubview(cardNumber)
        verticalStack.addArrangedSubview(horizontalStack)
        verticalStack.addArrangedSubview(cardHolder)
        
        doneBtn.addTarget(self, action: #selector(doneBtnHandler), for: .touchUpInside)
        
        cardNumber.delegate = self
        cardHolder.delegate = self
        cardExpDate.delegate = self
        cardCvv.delegate = self
    }
}


extension AddNewCardController: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
        self.dismiss(animated: true)
    }
    
    func rightBtnAction() {
    }
}
extension AddNewCardController {
    @objc func doneBtnHandler() {
       
    }
}

extension AddNewCardController: CardViewTextFieldDelegate {
    func textFieldDidEndEditing(with text: String) {
        print(text)
    }
}
