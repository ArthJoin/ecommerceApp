//
//  FooterProductDetail.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 31.10.2023.
//

import UIKit
//MARK: - AddToCardDelegate
protocol FooterProductDetailDelegate: AnyObject {
    func didAddToCard()
}

final class FooterProductDetail: BaseView {
    weak var delegate: FooterProductDetailDelegate?
    
    //MARK: - Private Properties
    private let addToCardBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Add to Cart", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        btn.backgroundColor = Resources.Colors.transpulentGray
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Resources.Colors.separator.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private let buyNowBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy Now", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = Resources.Fonts.systemWeight(with: 15, weight: .medium)
        btn.backgroundColor = Resources.Colors.transpulentGray
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Resources.Colors.separator.cgColor
        btn.layer.cornerRadius = 5
        return btn
    }()
}

extension FooterProductDetail {
    override func setupViews() {
        super.setupViews()
        addSubview(addToCardBtn)
        addSubview(buyNowBtn)
    }
    override func constaintViews() {
        super.constaintViews()
        addToCardBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(70)
            make.height.equalTo(50)
            make.width.equalTo(170)
        }
        buyNowBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(addToCardBtn)
            make.height.equalTo(50)
            make.width.equalTo(170)
        }
    }
    override func configureAppearance() {
        super.configureAppearance()
        addToCardBtn.addTarget(self, action: #selector(addToCardActionhighlighted), for: .touchDown)
        addToCardBtn.addTarget(self, action: #selector(addToCardActionUnhighlighted), for: [.touchUpInside, .touchDragExit, .touchUpOutside])
    }
}

extension FooterProductDetail {
    @objc func addToCardActionhighlighted() {
        UIView.animate(withDuration: 0.3) {
            self.addToCardBtn.backgroundColor = Resources.Colors.active
        }
        DispatchQueue.main.async {
            self.delegate?.didAddToCard()
        }
    }

    @objc func addToCardActionUnhighlighted() {
        UIView.animate(withDuration: 0.3) {
            self.addToCardBtn.backgroundColor = Resources.Colors.transpulentGray
        }
    }
}
