//
//  BaseController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 12.10.2023.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = Resources.Colors.background
    }
}
