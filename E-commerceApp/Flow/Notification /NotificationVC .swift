//
//  NotificationVC .swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 25.11.2023.
//

import UIKit
 
final class NotificationVC: BaseController {
     //MARK: - Public
    func configure() {}
    
    //MARK: - Private Properties
    private let navBar = GeneralNavigationBar()
}

extension NotificationVC {
    override func setupViews() {
        super.setupViews()
        view.addSubview(navBar)
    }
    override func constaintViews() {
        super.constaintViews()
        navBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
    override func configureAppearance() {
        super.configureAppearance()
        navBar.configure(with: "Notification")
        navBar.delegate = self
    }
}

extension NotificationVC: GeneralNavigationBarDelegate {
    func didBackBtnActionEnableTabBar() {
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    func rightBtnAction() {
        
    }
}
