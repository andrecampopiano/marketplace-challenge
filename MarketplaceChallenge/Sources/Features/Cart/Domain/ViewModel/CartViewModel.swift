//
//  CartViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import CoreSwift
import Foundation

protocol CartViewModelProtocol {
    var products: Dynamic<[CartModel]> { get }
}

final class CartViewModel: CartViewModelProtocol {
 
    // MARK: - Properties
    
    var products = Dynamic<[CartModel]>([])
}
