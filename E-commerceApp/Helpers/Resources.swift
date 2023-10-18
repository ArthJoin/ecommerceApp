//
//  Resources.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 11.10.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hexString: "#67C4A7")
        static var inactive = UIColor(hexString: "#939393")
        
        static var separator = UIColor(hexString: "#939393")
        static var background = UIColor(hexString: "#FFFFFF")

        static var titleGray = UIColor(hexString: "#393F42")
        static var secondary = UIColor(hexString: "#C8C8CB")
        
        static var commonIcon = UIColor(hexString: "#200E32")
    }
    
    enum Strings {
        enum TabBar {
            static var home = "Home"
            static var wishlist = "Heart"
            static var history = "Paper"
            static var account = "Account"
        }
        
        enum navBar {
            static var wishlist = "Wishlist"
            static var history = "History"
            static var account = "Account"
        }
        
        enum home {
            static var navBarLeft = "1"
            static var navBarRight = "2"
            
            
            static var deliveryAddressButton = "Delivery address"
        }
        enum wishlist {
            static var navBarLeft = "1"
            static var navBarRight = "2"
        }
        enum history {
            static var navBarLeft = "1"
            static var navBarRight = "2"
        }
        enum account {
            static var navBarLeft = "1"
            static var navBarRight = "2"
        }
    }
    
    enum Images {
        enum TabBar {
            static var home = UIImage(named: "Home_tab")
            static var wishlist = UIImage(named: "Heart_tab")
            static var history = UIImage(named: "Paper_tab")
            static var account = UIImage(named: "Account_tab")
        }
        
        enum common {
            static var downArrow = UIImage(named: "down_arrow")
            static var notififcation = UIImage(named: "Notification_icon")
            static var basket = UIImage(named: "basket_icon")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
