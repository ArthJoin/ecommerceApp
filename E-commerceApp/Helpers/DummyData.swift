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
        static var one = UIImage(named: "Category1_test")
        static var second = "Apparel" 
    }
    enum products {
        static var one = UIImage(named: "img")
        static var second = UIImage(named: "img-2")
        static var title = "Monitor LG 22”inc 4K 120Fps"
        static var subTitle = "$199.99"
    }
}
