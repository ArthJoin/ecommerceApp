//
//  TabBarController.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.10.2023.
//

import UIKit

enum Tabs: Int {
    case home
    case wishlist
    case history
    case account 
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 0.25
        tabBar.layer.masksToBounds = true
        
        let homeViewController = HomeController()
        let wishlistViewController = WishlistController()
        let historyViewController = HistoryController()
        let accountViewController = AccountController()
        
        let homeNavigation = NavBarController(rootViewController: homeViewController)
        let wishlistNavigation = NavBarController(rootViewController: wishlistViewController)
        let historyNavigation = NavBarController(rootViewController: historyViewController)
        let accountNavigation = NavBarController(rootViewController: accountViewController)
        
        homeNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.home,
                                                     image: Resources.Images.TabBar.home,
                                                     tag: Tabs.home.rawValue)
        wishlistNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.wishlist,
                                                     image: Resources.Images.TabBar.wishlist,
                                                     tag: Tabs.wishlist.rawValue)
        historyNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.history,
                                                     image: Resources.Images.TabBar.history,
                                                     tag: Tabs.history.rawValue)
        accountNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.account,
                                                     image: Resources.Images.TabBar.account,
                                                     tag: Tabs.account.rawValue)
        
        setViewControllers([
            homeNavigation,
            wishlistNavigation,
            historyNavigation,
            accountNavigation
        ],animated: false)

    }
}
