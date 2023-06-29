//
//  CartProductModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import Foundation

struct CartProductModel: Hashable, Equatable {
    var image: String?
    var name: String?
    var actualPrice: Double?
    var regularPrice: Double?
    var installmentsPrice: Double?
    var installmentsQuantity: Int?
}

struct CartProductVariantModel: Hashable, Equatable {
    var sku: String?
    var name: String?
    var quantity: Int?
    var product: CartProductModel?
}

struct CartModel: Hashable, Equatable {
    var productVariant: CartProductVariantModel?
}
