//
//  ProductResponse.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import Foundation

typealias ProductListResponse = [ProductResponse]

class ProductSizeResponse: Decodable {
    var available: Bool?
    var size: String?
    var sku: String?
}

class ProductResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case style
        case codeColor = "code_color"
        case colorSlug = "color_slug"
        case color
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case installments
        case image
    }
    
    var name: String?
    var style: String?
    var codeColor: String?
    var colorSlug: String?
    var color: String?
    var onSale: Bool?
    var regularPrice: String?
    var actualPrice: String?
    var discountPercentage: String?
    var installments: String?
    var image: String?
    var sizes: [ProductSizeResponse]?
}
