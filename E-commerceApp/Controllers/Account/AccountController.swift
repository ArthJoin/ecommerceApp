//
//  AccountController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 12.10.2023.
//

import UIKit

class AccountController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = Resources.Strings.navBar.account
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.account
        
        addNavBarButton(at: .left, with: Resources.Strings.account.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.account.navBarRight)
    }


}
