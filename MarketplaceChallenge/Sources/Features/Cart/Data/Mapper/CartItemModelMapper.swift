//
//  CartItemModelMapper.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 29/06/23.
//

import Foundation

enum CartItemModelMapper {
    static func map(cartModel: CartModel?) -> CartItemModel {
        let amount: Double = cartModel?.productVariant?.product?.actualPrice ?? .zero * Double(cartModel?.productVariant?.quantity ?? .zero)
        
        return CartItemModel(title: cartModel?.productVariant?.product?.name,
                             amount: amount,
                             priceItem: cartModel?.productVariant?.product?.actualPrice,
                             image: cartModel?.productVariant?.product?.image,
                             quantity: cartModel?.productVariant?.quantity,
                             size: cartModel?.productVariant?.name)
    }
}
