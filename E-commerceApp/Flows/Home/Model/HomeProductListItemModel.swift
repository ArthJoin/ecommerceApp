//
//  HomeProductListItemModel.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 19.10.2023.
//

import UIKit

struct HomeProductListItemModel {
    let marketId: Int
    let productId: Int
    let image: UIImage
    let title: String
    let subTitle: String
    var isWishlist: Bool
    var isBasket: Bool
}

typealias HomeProductListCellModel = [HomeProductListItemModel]
