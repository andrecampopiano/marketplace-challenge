//
//  FactoryCartModels.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 28/06/23.
//

import Foundation

enum FactoryCartModels {
    static func createCartModel() -> [CartModel] {
        var cartModel = [CartModel]()
        var cartProductVariant: CartProductVariantModel?
        var cartProduct: CartProductModel?
        
        cartProduct = FactoryCartModels.cartProdcutModel(image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
                                                         name: "VESTIDO TRANSPASSE BOW",
                                                         actualPrice: 199.90,
                                                         regularPrice: 199.90,
                                                         installmentsPrice: 66.63,
                                                         installmentsQuantity: 3)
        cartProductVariant = FactoryCartModels.cartProductVariant(sku: "5807_343_0_PP", name: "PP", quantity: 2, product: cartProduct)
        cartModel.append(CartModel(productVariant: cartProductVariant))
        
        cartProduct = FactoryCartModels.cartProdcutModel(image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
                                                         name: "VESTIDO TRANSPASSE BOW",
                                                         actualPrice: 199.90,
                                                         regularPrice: 199.90,
                                                         installmentsPrice: 66.63,
                                                         installmentsQuantity: 3)
        cartProductVariant = FactoryCartModels.cartProductVariant(sku: "5807_343_0_P", name: "P", quantity: 1, product: cartProduct)
        cartModel.append(CartModel(productVariant: cartProductVariant))
        
        cartProduct = FactoryCartModels.cartProdcutModel(image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
                                                         name: "VESTIDO TRANSPASSE BOW",
                                                         actualPrice: 199.90,
                                                         regularPrice: 199.90,
                                                         installmentsPrice: 66.63,
                                                         installmentsQuantity: 3)
        cartProductVariant = FactoryCartModels.cartProductVariant(sku: "5807_343_0_M", name: "M", quantity: 4, product: cartProduct)
        cartModel.append(CartModel(productVariant: cartProductVariant))
        
        return cartModel
    }
    
    static func cartProductVariant(sku: String?, name: String, quantity: Int?, product: CartProductModel?) -> CartProductVariantModel {
        return CartProductVariantModel(sku: sku,
                                       name: name,
                                       quantity: quantity,
                                       product: product)
    }
    
    static func cartProdcutModel(image: String?, name: String?, actualPrice: Double?, regularPrice: Double?, installmentsPrice: Double?, installmentsQuantity: Int?) -> CartProductModel {
        return CartProductModel(image: image,
                                name: name,
                                actualPrice: actualPrice,
                                regularPrice: regularPrice,
                                installmentsPrice: installmentsPrice,
                                installmentsQuantity: installmentsQuantity)
        
    }
}
