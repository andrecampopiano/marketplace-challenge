//
//  ProductResponseMapper.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 19/06/23.
//

import Foundation

enum ProductResponseMapper {
    
    static func map(sizeResponse: ProductSizeResponse?) -> ProductSizeModel {
        return ProductSizeModel(available: sizeResponse?.available,
                                size: sizeResponse?.size,
                                sku: sizeResponse?.sku,
                                quantity: sizeResponse?.quantity)
    }
    
    static func map(response: ProductResponse?) -> ProductModel {
        
        let sizes = response?.sizes?.map { map(sizeResponse: $0) }
        
        return ProductModel(name: response?.name,
                            onSale: response?.onSale,
                            regularPrice: response?.regularPrice,
                            regularPriceValue: response?.regularPrice?.splitAndConvert("R$", componentIndex: 1, using: StringToDoubleConverter()),
                            actualPrice: response?.actualPrice,
                            actualPriceValue: response?.actualPrice?.splitAndConvert("R$", componentIndex: 1, using: StringToDoubleConverter()),
                            discountPercentage: response?.discountPercentage,
                            installments: response?.installments,
                            installmentsPrice: response?.installments?.splitAndConvert("R$", componentIndex: 1, using: StringToDoubleConverter()),
                            installmentsQuantity: response?.installments?.splitAndConvert("x", componentIndex: 0, using: StringToIntConverter()),
                            image: response?.image,
                            sizes: sizes)
    }
    
    static func map(responses: [ProductResponse]?) -> [ProductModel]? {
        return responses?.map { map(response: $0) }
    }
}
