//
//  CartBusiness.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 20/06/23.
//

import CoreSwift
import Foundation

typealias FetchProductsCompletion = (Result<[CartModel]?, Error>) -> Void

protocol CartBusinessProtocol {
    func fetchProducts(completion: @escaping FetchProductsCompletion)
    func addItem()
    func deleteItemToProdcut()
    func deleteAllItemToProduct()
    func deleteAllProducts()
}

struct CartBusiness: CartBusinessProtocol {
    
    func fetchProducts(completion: @escaping FetchProductsCompletion) { }
    
    func addItem() { }
    func deleteItemToProdcut() { }
    func deleteAllItemToProduct() { }
    func deleteAllProducts() { }
}
