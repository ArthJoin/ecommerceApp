//
//  DummyData.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 18.10.2023.
//

import UIKit

enum DummyData {
    enum banner {
        static var first = UIImage(named: "banner1_test")
    }
    enum category {
        static var category1 = UIImage(named: "category1")
        static var category1Title = "Apparel"
        static var category2 = UIImage(named: "category2")
        static var category2Title = "School"
        static var category3 = UIImage(named: "category3")
        static var category3Title = "Sport"
        static var category4 = UIImage(named: "category4")
        static var category4Title = "Electronic"
        static var category5 = UIImage(named: "category5")
        static var category5Title = "All"
    }
    enum products {
        static var one = UIImage(named: "img")
        static var second = UIImage(named: "img-2")
        static var title = "Monitor LG 22”inc 4K 120Fps"
        static var subTitle = 199.99
    }
    
    enum market {
        enum logo {
            static var market1 = UIImage(named: "market_id0")
            static var market2 = UIImage(named: "market_id1")
        }
    }
}

