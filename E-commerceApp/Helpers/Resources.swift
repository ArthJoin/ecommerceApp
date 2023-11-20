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
        static var backgroundElement = UIColor(hexString: "#FAFAFC")
        static var transpulentGray = UIColor(hexString: "#F0F2F1")

        static var titleMain = UIColor(hexString: "#393F42")
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
            static var settings = "Settings"
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
            static var notififcation = UIImage(named: "Notification_icon")
            static var basket = UIImage(named: "basket_icon")
            static var search = UIImage(named: "Search")
            static var MasterCardVisaLogos = UIImage(named: "vise+mastercardLogo")
        }
        
        enum buttons {
            static func wishlistInactive(with btn: UIButton) {
                btn.tintColor = Resources.Colors.inactive
                if let systemImage = UIImage(systemName: "heart") {
                    let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
                    btn.setImage(resizedImage, for: .normal)
                }
            }
            static func wishlistActive(with btn: UIButton) {
                btn.tintColor = .red
                if let systemImage = UIImage(systemName: "heart.fill") {
                    let resizedImage = systemImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
                    btn.setImage(resizedImage, for: .normal)
                }
            }
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        static func systemWeight(with size: CGFloat, weight: UIFont.Weight) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}
