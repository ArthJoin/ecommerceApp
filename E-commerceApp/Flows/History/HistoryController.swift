//
//  HistoryController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 12.10.2023.
//

import UIKit

class HistoryController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = Resources.Strings.navBar.history
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.history
        
        addNavBarButton(at: .left, with: Resources.Strings.history.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.history.navBarRight)
    }


}
