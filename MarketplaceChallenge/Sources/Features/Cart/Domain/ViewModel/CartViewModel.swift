//
//  CartViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import CoreSwift
import Foundation

protocol CartViewModelProtocol {
    
    var products: Dynamic<[ProductResponse]> { get }
    
    func removeAllProducts()
    func removeItemFromProduct(row: Int)
    func addProductItem(row: Int)
}

final class CartViewModel: CartViewModelProtocol {
  
    // MARK: - Properties
    
    var products = Dynamic<[ProductResponse]>([])
    
    // MARK: - Public Methods
    
    func removeAllProducts() { }
    
    func removeItemFromProduct(row: Int) { }
    
    func addProductItem(row: Int) { }
}
