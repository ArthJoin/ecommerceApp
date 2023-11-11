//
//  OrderSummaryView.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 07.11.2023.
//

import UIKit

protocol OrderSummaryViewDelegate: AnyObject {
    func didPaymentMethodBtnTapped()
}

final class OrderSummaryView: BaseView {
    //MARK: - Public
    func configure() {
        self.price = MocNetworkManager.shared.getBasketSelectedItemsPrice()
        self.priceLabel.text = "$\(self.price)"
    }
    func changeBtnText(with text: String) {
        self.paymentMethodBtn.setTitle(text, for: .normal)
    }
    
    weak var delegate: OrderSummaryViewDelegate?
    
    //MARK: - Private UIConstants
    private enum UIConstants {
        static let headerFontSize: CGFloat = 17
        static let fontSize: CGFloat = 14
        static let leadingInset: CGFloat = 30
        static let topOffset: CGFloat = 15
        static let paymentBtnHeight: CGFloat = 40
        static let labelWidth: CGFloat = 50
    }
    
    //MARK: - Private Properties
    private var price: Double = 0.0
    
    private let paymentMethodBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Continue", for: .normal)
        btn.titleLabel?.font = Resources.Fonts.helveticaRegular(with: UIConstants.fontSize)
        btn.backgroundColor = Resources.Colors.active
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private let orderSummaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Order summary"
        label.font = Resources.Fonts.systemWeight(with: UIConstants.headerFontSize, weight: .medium)
        return label
    }()
    
    private let totalsLabel: UILabel = {
        let label = UILabel()
        label.text = "Totals"
        label.font = Resources.Fonts.helveticaRegular(with: UIConstants.fontSize)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: UIConstants.fontSize)
        label.text = "$0.0"
        return label
    }()
}

//MARK: - Ovveride
extension OrderSummaryView {
    override func setupViews() {
        super.setupViews()
        addSubview(paymentMethodBtn)
        addSubview(orderSummaryLabel)
        addSubview(totalsLabel)
        addSubview(priceLabel)
    }
    
    override func constaintViews() {
        super.constaintViews()
        orderSummaryLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(UIConstants.leadingInset)
            make.top.equalToSuperview().offset(UIConstants.topOffset)
        }
        totalsLabel.snp.makeConstraints { make in
            make.top.equalTo(orderSummaryLabel.snp.bottom).offset(UIConstants.topOffset)
            make.leading.equalToSuperview().inset(UIConstants.leadingInset)
        }
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(totalsLabel)
            make.trailing.equalToSuperview().inset(UIConstants.leadingInset)
        }
        paymentMethodBtn.snp.makeConstraints { make in
            make.top.equalTo(totalsLabel.snp.bottom).offset(UIConstants.topOffset)
            make.bottom.equalToSuperview().inset(UIConstants.leadingInset)
            make.height.equalTo(UIConstants.paymentBtnHeight)
            make.leading.trailing.equalToSuperview().inset(UIConstants.leadingInset)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
        addSeparator(is: false)
        makeSystem(paymentMethodBtn)
        paymentMethodBtn.addTarget(self, action: #selector(paymentMethodAction), for: .touchUpInside)
    }
    
    @objc func paymentMethodAction() {
        if price > 0.0 {
            delegate?.didPaymentMethodBtnTapped()
        }
    }
}
