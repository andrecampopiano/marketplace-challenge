//
//  CartProductModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import Foundation

struct CartProductModel: Hashable, Equatable {
    let image: String?
    let name: String?
    let actualPrice: Float?
    let regularPrice: Float?
    let installmentsPrice: Float?
    let installmentsQuantity: Int?
}

struct CartProductVariantModel: Hashable, Equatable {
    let sku: String?
    let name: String?
    let avaliable: Bool?
    let quantity: Int?
    let product: CartProductModel?
}

struct CartModel: Hashable, Equatable {
    let productVariant: CartProductVariantModel?
}
