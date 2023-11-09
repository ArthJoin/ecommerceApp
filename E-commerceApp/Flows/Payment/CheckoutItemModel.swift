//
//  CheckoutItemModel.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 09.11.2023.
//

import Foundation

enum CheckoutItemModel {
    case productList([ProductListItemModel])
    case deliveryType
    case paymentMethod
}
