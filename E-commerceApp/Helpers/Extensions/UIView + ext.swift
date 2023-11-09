//
//  UIView + ext.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 13.10.2023.
//

import UIKit

extension UIView {
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    func addSeparator(is bool: Bool) {
        let separator = UIView()
        separator.backgroundColor = Resources.Colors.transpulentGray
        self.addSubview(separator)
        
        if bool {
            separator.snp.makeConstraints { make in
                make.trailing.leading.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
        } else {
            separator.snp.makeConstraints { make in
                make.trailing.leading.top.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
}
