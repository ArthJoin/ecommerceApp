//
//  PaymentMethodController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.11.2023.
//

import UIKit


final class PaymentMethodVC: BaseController {
    //MARK: - Private Properties
    private let header: UILabel = {
        let label = UILabel()
        label.text = "Select payment method"
        label.font = Resources.Fonts.systemWeight(with: 17, weight: .medium)
        return label
    }()
    private let closeBtn: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        if let systemImage = UIImage(systemName: "xmark") {
            let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 15, weight: .regular))
            btn.setImage(resizedImage, for: .normal)
        }
        return btn
    }()
    private let stack = UIStackView()
    private let tableView = UITableView()
    private let addNewCardBtn: UIButton = {
        let btn = UIButton()
        if let systemImage = UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill") {
            let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .regular))
            btn.tintColor = Resources.Colors.active
            btn.setImage(resizedImage, for: .normal)
            btn.setTitleColor(Resources.Colors.inactive, for: .normal)
            btn.setTitle("  Add new card", for: .normal)
            btn.layer.borderWidth = 0.5
            btn.layer.borderColor = Resources.Colors.inactive.cgColor
            btn.layer.cornerRadius = 10
        }
        return btn
    }()
}

extension PaymentMethodVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(stack)
        view.addSubview(addNewCardBtn)
        view.addSubview(tableView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        stack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stack.snp.bottom).offset(15)
            make.trailing.leading.equalToSuperview()
        }
        addNewCardBtn.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(30)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.layer.cornerRadius = 24
        stack.axis = .horizontal
        stack.addArrangedSubview(header)
        stack.addArrangedSubview(closeBtn)
        stack.alignment = .center
        stack.distribution = .equalSpacing
        closeBtn.addTarget(self, action: #selector(closeBtnHandler), for: .touchUpInside)
        addNewCardBtn.addTarget(self, action: #selector(addNewCardBtnHandler), for: .touchUpInside)
    }
}

extension PaymentMethodVC {
    @objc func closeBtnHandler() {
        self.dismiss(animated: true)
    }
    @objc func addNewCardBtnHandler() {
        let secondVC = AddNewCardController()
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
    }
}
