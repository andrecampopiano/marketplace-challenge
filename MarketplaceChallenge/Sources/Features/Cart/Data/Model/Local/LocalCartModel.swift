//
//  LocalCartModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import Foundation

struct LocalCartProductModel: Equatable {
    let image: String?
    let name: String?
    let actualPrice: Double?
    let regularPrice: Double?
    let installmentsPrice: Double?
    let installmentsQuantity: Int?
}

struct LocalCartProductVariantModel: Equatable {
    let sku: String?
    let name: String?
    let avaliable: Bool?
    let quantity: Int?
    let product: LocalCartProductModel?
}

struct LocalCartModel: Equatable {
    let productVariant: LocalCartProductVariantModel?
}
