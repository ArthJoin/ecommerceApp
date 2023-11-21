//
//  HomeSearchController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 23.10.2023.
//

import UIKit

class HomeSearchController: UISearchController {
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

private extension HomeSearchController {
    func initialize() {
        self.searchBar.sizeToFit()
        self.searchBar.layer.borderWidth = 1
        self.searchBar.layer.borderColor = UIColor.white.cgColor
        self.searchBar.searchTextField.backgroundColor = .clear
        self.searchBar.searchTextField.font = Resources.Fonts.helveticaRegular(with: 13)
        self.searchBar.setImage(Resources.Images.common.search, for: .search, state: .normal)
        self.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: " Search here ...", attributes: [NSAttributedString.Key.foregroundColor : Resources.Colors.transpulentGray])
    }
}

