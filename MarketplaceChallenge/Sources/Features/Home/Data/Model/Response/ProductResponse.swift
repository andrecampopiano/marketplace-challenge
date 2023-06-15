//
//  ProductResponse.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import Foundation

struct ProductListResponse: Decodable {
    var products: [ProductResponse]?
}

struct ProductSizeResponse: Decodable {
    var available: Bool?
    var size: String?
    var sku: String?
}

struct ProductResponse: Decodable {
    
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
        case sizes
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

extension ProductResponse {
    func isEqual(to product: ProductResponse) -> Bool {
        return name == product.name
    }
}
