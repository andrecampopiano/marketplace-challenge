//
//  CartModelMapper.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 20/06/23.
//

import Foundation

enum CartModelMapper {
    static func map(product localModel: LocalCartProductModel?) -> CartProductModel? {
        return CartProductModel(image: localModel?.image,
                                name: localModel?.name,
                                actualPrice: localModel?.actualPrice,
                                regularPrice: localModel?.regularPrice,
                                installmentsPrice: localModel?.installmentsPrice,
                                installmentsQuantity: localModel?.installmentsQuantity)
    }
    
    static func map(productVariant localModel: LocalCartProductVariantModel?) -> CartProductVariantModel? {
        let product = self.map(product: localModel?.product)
        return CartProductVariantModel(sku: localModel?.sku,
                                       name: localModel?.name,
                                       quantity: localModel?.quantity,
                                       product: product)
    }
    
    static func map(cart localModel: LocalCartModel) -> CartModel {
        let productVariant = self.map(productVariant: localModel.productVariant)
        return CartModel(productVariant: productVariant)
    }
    
    static func map(carts localModel: [LocalCartModel]?) -> [CartModel]? {
        return localModel?.map { map(cart: $0) }
    }
}
