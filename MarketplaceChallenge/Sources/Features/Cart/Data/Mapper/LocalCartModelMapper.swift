//
//  LocalCartModelMapper.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 20/06/23.
//

import Foundation

enum LocalCartModelMapper {
    static func map(product model: CartProductModel?) -> LocalCartProductModel {
        return LocalCartProductModel(image: model?.image,
                                     name: model?.name,
                                     actualPrice: model?.actualPrice,
                                     regularPrice: model?.regularPrice,
                                     installmentsPrice: model?.installmentsPrice,
                                     installmentsQuantity: model?.installmentsQuantity)
    }
    
    static func map(productVariant model: CartProductVariantModel?) -> LocalCartProductVariantModel {
        let product: LocalCartProductModel = self.map(product: model?.product)
        return LocalCartProductVariantModel(sku: model?.sku,
                                            name: model?.name,
                                            avaliable: model?.avaliable,
                                            quantity: model?.quantity,
                                            product: product)
    }
    
    static func map(cart model: CartModel) -> LocalCartModel {
        let productVariant = self.map(productVariant: model.productVariant)
        return LocalCartModel(productVariant: productVariant)
    }
    
    static func map(carts model: [CartModel]) -> [LocalCartModel] {
        return model.map { map(cart: $0) }
    }
    
    static func map(product managed: ManagedCartProduct?) -> LocalCartProductModel {
        return LocalCartProductModel(image: managed?.image,
                                     name: managed?.name,
                                     actualPrice: managed?.actualPrice,
                                     regularPrice: managed?.regularPrice,
                                     installmentsPrice: managed?.installmentsPrice,
                                     installmentsQuantity: managed?.installmentsQuantity)
    }
    
    static func map(productVariant managed: ManagedCartProductVariant?) -> LocalCartProductVariantModel {
        let product: LocalCartProductModel = self.map(product: managed?.product)
        return LocalCartProductVariantModel(sku: managed?.sku,
                                            name: managed?.name,
                                            avaliable: managed?.avaliable,
                                            quantity: Int(managed?.quantity ?? .zero),
                                            product: product)
    }
    
    static func map(cart managed: ManagedCart) -> LocalCartModel {
        let productVariant = self.map(productVariant: managed.productVariant)
        return LocalCartModel(productVariant: productVariant)
    }
    
    static func map(carts managed: [ManagedCart]) -> [LocalCartModel] {
        return managed.map { map(cart: $0) }
    }
}
