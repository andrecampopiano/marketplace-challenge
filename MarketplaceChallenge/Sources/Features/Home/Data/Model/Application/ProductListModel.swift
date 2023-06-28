//
//  ProductListModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 16/06/23.
//

import Foundation

struct ProductSizeModel: Hashable, Equatable {
    var available: Bool?
    var size: String?
    var sku: String?
    var quantity: Int?
}

struct ProductModel: Hashable, Equatable {
    var name: String?
    var onSale: Bool?
    var regularPrice: String?
    var regularPriceValue: Double?
    var actualPrice: String?
    var actualPriceValue: Double?
    var discountPercentage: String?
    var installments: String?
    var installmentsPrice: Double?
    var installmentsQuantity: Int?
    var image: String?
    var sizes: [ProductSizeModel]?
}
