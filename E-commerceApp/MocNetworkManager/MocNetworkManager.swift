//
//  MocNetworkManager.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 31.10.2023.
//

import Foundation
import UIKit

class MocNetworkManager {
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
                HomeCategoryItemModel(image: DummyData.category.category1!, title: DummyData.category.category1Title),
                HomeCategoryItemModel(image: DummyData.category.category2!, title: DummyData.category.category2Title),
                HomeCategoryItemModel(image: DummyData.category.category3!, title: DummyData.category.category3Title),
                HomeCategoryItemModel(image: DummyData.category.category4!, title: DummyData.category.category4Title),
                HomeCategoryItemModel(image: DummyData.category.category5!, title: DummyData.category.category5Title),
            ]),
        ]
        for i in productList {
            HomeProductIdList.append(i.productId)
        }
        HomeDB.append(.productList(HomeProductIdList))
        
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
    
    func getProductList() -> [ProductListItemModel] {
        return productList
    }
    
    func getProductById(with productId: Int) -> ProductListItemModel {
        if let index = productList.firstIndex(where: { $0.productId == productId }) {
            return productList[index]
        }
        return ProductListItemModel(marketId: 000, productId: 000, image: UIImage(), title: "", subTitle: 0, isWishlist: false, isBasket: false)
    }
    
    func getBasketProductList() -> [ProductListItemModel] {
        return basketProductList
    }
    
    func getWishlistProductList() -> [ProductListItemModel] {
        return wishlistProductList
    }
    
    func getBasketSelectedItemsPrice() -> Double {
        return selectedBasketPrice
    }
    
    func getPaymentProductList() -> [ProductListItemModel] {
        return paymentProductList
    }
    
    //MARK: - Post Methods
    func postProductToBasket(with product: ProductListItemModel) {
        self.basketProductList.append(product)
    }
    
    func addBasketPrice(with price: Double) {
        self.selectedBasketPrice += price
    }

    func postPaymentProductList(with product: ProductListItemModel) {
        self.paymentProductList.append(product)
    }
    
    func postProductToWishlist(with product: ProductListItemModel) {
        self.wishlistProductList.append(product)
    }
    
    //MARK: - Delete Methods
    func deleteProductFromBasket(with index: Int) {
        basketProductList.remove(at: index)
    }
    
    func removeBasketPrice(with price: Double) {
        self.selectedBasketPrice -= price
    }
    
    func deleteProductFromWishlist(with productId: Int) {
        if let index = wishlistProductList.firstIndex(where: { $0.productId == productId }) {
            wishlistProductList.remove(at: index)
        }
    }
    
    func deletePaymentProductList(with productId: Int) {
        if let index = paymentProductList.firstIndex(where: { $0.productId == productId }) {
            paymentProductList.remove(at: index)
        }
    }
    
    //MARK: - Put Methods
    func putProductListAddBasket(with productId: Int) {
        if let index = productList.firstIndex(where: { $0.productId == productId }) {
            productList[index].isBasket = true
        }
    }
    func putProductListRemoveBasket(with productId: Int) {
        if let index = productList.firstIndex(where: { $0.productId == productId }) {
            productList[index].isBasket = false
        }
    }
    func putProductListAddWishlist(with productId: Int) {
        if let index = productList.firstIndex(where: { $0.productId == productId }) {
            productList[index].isWishlist = true
        }
    }
    func putProductListRemoveWishlist(with productId: Int) {
        if let index = productList.firstIndex(where: { $0.productId == productId }) {
            productList[index].isWishlist = false
        }
    }
    
    //MARK: - My Arrays
    private var productList: HomeProductListCellModel = [
        .init(marketId: 0, productId: 983, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 1, productId: 213, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 0, productId: 743, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 1, productId: 891, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 0, productId: 168, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 1, productId: 902, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 0, productId: 123, image: DummyData.products.one!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false),
        .init(marketId: 1, productId: 390, image: DummyData.products.second!, title: DummyData.products.title, subTitle: DummyData.products.subTitle, isWishlist: false, isBasket: false)
    ]
    
    private var HomeProductIdList: [Int] = []
    private var basketProductList: [ProductListItemModel] = []
    var selectedBasketPrice: Double = 0.0
    private var paymentProductList: [ProductListItemModel] = []
    private var wishlistProductList: [ProductListItemModel] = []

    
    private var MarketInfo: [MarketInfoModel] = [
        .init(id: 0, image: DummyData.market.logo.market1!, marketName: "Shopify Market", marketLastOnline: "12 hour ago"),
        .init(id: 1, image: DummyData.market.logo.market2!, marketName: "Magnet Digital", marketLastOnline: "1 min ago")
    ]
}
