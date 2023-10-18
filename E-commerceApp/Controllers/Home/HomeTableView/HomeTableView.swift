//
//  HomeTableView.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 17.10.2023.
//

import UIKit

class HomeTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        let nib = UINib(nibName: "BannerTableCell", bundle: .main)
        self.register(nib, forCellReuseIdentifier: "BannerTableCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableCell", for: indexPath)
        return cell
    }
}
