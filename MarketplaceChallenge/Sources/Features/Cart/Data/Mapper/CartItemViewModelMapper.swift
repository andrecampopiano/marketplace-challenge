//
//  CartItemViewModelMapper.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 29/06/23.
//

import Foundation

enum CartItemViewModelMapper {
    static func map(cartModel: CartModel?) -> CartItemViewModelProtocol {
        return CartItemViewModel(model: CartItemModelMapper.map(cartModel: cartModel))
    }
    
    static func map(cartsModel: [CartModel]?) -> [CartItemViewModelProtocol]? {
        return cartsModel?.map { map(cartModel: $0) }
    }
}
