//
//  CardDataView.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.11.2023.
//

import UIKit

final class CardViewTextField: BaseView {
    
    //MARK: - Public
    func configure(header name: String, placeholder text: String, isImage hidden: Bool = true, textField tag: Int, keyboard type: Bool = false) {
        self.header.text = name
        self.textField.placeholder = text
        self.visaMasterImg.isHidden = hidden
        self.textField.tag = tag
        if type {
            self.textField.keyboardType = .default
        } else {
            self.textField.textContentType = .creditCardNumber
        }
    }
    
    //MARK: - Private Properties
    private let header: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 14)
        label.textColor = Resources.Colors.separator
        return label
    }()
    
    private let textFieldView: UIView = {
        let view = UIView()
        view.layer.borderColor = Resources.Colors.secondary.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    private let visaMasterImg: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Images.common.MasterCardVisaLogos
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = Resources.Fonts.helveticaRegular(with: 14)
        return textField
    }()
    
}

// MARK: - TextFieldSetup
extension CardViewTextField {
    override func setupViews() {
        super.setupViews()
        addSubview(header)
        addSubview(textFieldView)
        textFieldView.addSubview(textField)
        textFieldView.addSubview(visaMasterImg)
    }
    
    override func constaintViews() {
        super.constaintViews()
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        textFieldView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
            make.bottom.equalToSuperview()
        }
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalTo(visaMasterImg.snp.leading).inset(10)
        }
        visaMasterImg.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(80)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        textField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension CardViewTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 0 {
            let input = textField.text ?? ""
            let numberOnly = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            var formatted = ""
            var cardNum = ""
            for char in numberOnly {
                if cardNum.count == 4 {
                    formatted += cardNum + " "
                    cardNum = ""
                }
                cardNum.append(char)
            }
            
            formatted += cardNum
            textField.text = formatted
            
            let maxLenghth = 19
            let newLenghth = input.count + string.count - range.length
            
            return newLenghth <= maxLenghth
        } else if textField.tag == 1 {
            let input = textField.text ?? ""
            let numberOnly = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            var formatted = ""
            var mmyy = ""
            for char in numberOnly {
                if mmyy.count == 2 {
                    formatted += mmyy + "/"
                    mmyy = ""
                }
                mmyy.append(char)
            }
            formatted += mmyy
            
            textField.text = formatted
            
            let maxLenghth = 5
            let newLenghth = input.count + string.count - range.length
            return newLenghth <= maxLenghth
        } else if textField.tag == 2 {
            let maxLenghth = 3
            let input = textField.text ?? ""
            let newLenghth = input.count + string.count - range.length
            return newLenghth <= maxLenghth
        } else {
            return true
        }
    }
}
