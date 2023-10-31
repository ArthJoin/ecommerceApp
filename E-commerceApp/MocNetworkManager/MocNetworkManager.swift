//
//  MocNetworkManager.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 31.10.2023.
//

import Foundation
import UIKit

protocol NetworkService {
    func getHomeDB() -> [HomeItemType]
    func getMarketInfo(with id: Int) -> MarketInfoModel
    func addProductWithId(with id: Int) -> HomeProductListItemModel
}

class MocNetworkManager: NetworkService {
   
    static let shared = MocNetworkManager()
    private init() {}
    
    
    //MARK: - Get Methods
    func getHomeDB() -> [HomeItemType] {
        var HomeDB: [HomeItemType] = [
            .banner([
                HomeBannerItemModel(image: DummyData.banner.first!),
                HomeBannerItemModel(image: DummyData.banner.first!),
                HomeBannerItemModel(image: DummyData.banner.first!)
            ]),
            .category([
                HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
                HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
                HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
                HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
                HomeCategoryItemModel(image: DummyData.category.one!, title: DummyData.category.second),
            ]),
        ]
        HomeProductList = productList
        HomeDB.append(.productList(HomeProductList))
        
        return HomeDB
    }
    
    func getMarketInfo(with id: Int) -> MarketInfoModel {
        let data = MarketInfo
        for i in data {
            if i.id == id {
                return i
            }
        }
        return MarketInfoModel(id: 404, image: UIImage(), marketName: "", marketLastOnline: "")
    }
    
    func addProductWithId(with id: Int) -> HomeProductListItemModel {
        let data = productList
        for i in data {
            if i.productId == id {
                return i
            }
        }
        return HomeProductListItemModel(marketId: 101, productId: 101, image: UIImage(), title: "", subTitle: "")
    }
    
    
    //MARK: - My Arrays
    let productList: HomeProductListCellModel = [
        .init(marketId: 0, productId: 0, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 1, productId: 0, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 0, productId: 0, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 1, productId: 0, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 0, productId: 0, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 1, productId: 0, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 0, productId: 0, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle),
        .init(marketId: 1, productId: 0, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle)
    ]
    var HomeProductList: HomeProductListCellModel = []
    let MarketInfo: [MarketInfoModel] = [
        .init(id: 0, image: Resources.Images.common.notififcation!, marketName: "NotificationMarket", marketLastOnline: "12 hour ago"),
        .init(id: 1, image: Resources.Images.common.basket!, marketName: "BasketMarket", marketLastOnline: "1 min ago")
    ]
}
