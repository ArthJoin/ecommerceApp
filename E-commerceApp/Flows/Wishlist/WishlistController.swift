//
//  WishlistController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 12.10.2023.
//

import UIKit

class WishlistController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = Resources.Strings.navBar.wishlist
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.wishlist
        
        addNavBarButton(at: .left, with: Resources.Strings.wishlist.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.wishlist.navBarRight)
    }


}
