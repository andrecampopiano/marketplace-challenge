//
//  LocalProductListModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 16/06/23.
//

import Foundation

struct LocalProductSizeModel: Equatable {
    var available: Bool?
    var size: String?
    var sku: String?
    var quantity: Int?
}

struct LocalProductModel: Equatable {
    var name: String?
    var onSale: Bool?
    var regularPrice: String?
    var actualPrice: String?
    var discountPercentage: String?
    var installments: String?
    var image: String?
    var sizes: [LocalProductSizeModel]?
}

struct LocalProductListModel: Equatable {
    var products: [LocalProductModel]?
}
