//
//  HomeSearchBar.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 23.10.2023.
//

import UIKit

class HomeSearchBar: UISearchBar {
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Constants
    private enum UIConstants {
        
    }
    
    //MARK: - Private Properties
    private let searchBar: UISearchBar = {
       let search = UISearchBar()
        search.sizeToFit()
        search.layer.borderWidth = 1
        search.layer.borderColor = UIColor.white.cgColor
        search.searchTextField.backgroundColor = .clear
        search.searchTextField.font = Resources.Fonts.helveticaRegular(with: 13)
        search.setImage(Resources.Images.common.search, for: .search, state: .normal)
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: " Search here ...", attributes: [NSAttributedString.Key.foregroundColor: Resources.Colors.transpulentGray])

        return search
    }()
}

//MARK: - Private method
private extension HomeSearchBar {
    func initialize() {
        searchBar.delegate = self
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - UISearchBarDelegate
extension HomeSearchBar: UISearchBarDelegate {
    //Обработать нажатие
}
