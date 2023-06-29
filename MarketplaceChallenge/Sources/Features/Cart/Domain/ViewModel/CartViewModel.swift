//
//  CartViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import CoreSwift
import Foundation

enum CartViewModelStatus {
    case loaded
    case loading
    case emptyList
}

typealias AddItemToCart = (_ item: CartModel?) -> Void

protocol CartViewModelProtocol {
    var status: Dynamic<CartViewModelStatus> { get }
    var cartItemsViewModel: Dynamic<[CartItemViewModelProtocol]?> { get }
    var amountValue: Dynamic<String?> { get }
    
    func addItem(cart: CartModel?)
    func removeItem(position: Int)
    func clearCart()
}

final class CartViewModel: CartViewModelProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let formatValue: String = "%@ %@"
        static let amountText: String = "Valor Total:"
    }
    
    // MARK: - Properties
    
    var status = Dynamic<CartViewModelStatus>(.loaded)
    var cartItemsViewModel = Dynamic<[CartItemViewModelProtocol]?>([])
    var amountValue = Dynamic<String?>(nil)
    
    init() {
        updateAmountValue()
    }
    
    // MARK: - Public Methods
    
    func addItem(cart: CartModel?) {
        cartItemsViewModel.value?.append(CartItemViewModelMapper.map(cartModel: cart))
        updateAmountValue()
        status.value = .loaded
    }
    
    func removeItem(position: Int) {
        cartItemsViewModel.value?.remove(at: position)
        updateAmountValue()
        status.value = .loaded
    }
    
    func clearCart() {
        cartItemsViewModel.value?.removeAll()
        updateAmountValue()
        status.value = .emptyList
    }
    
    private func updateAmountValue() {
        var amountValue: Double = .zero
        cartItemsViewModel.value?.forEach { amountValue += $0.model?.amount ?? .zero }
        
        self.amountValue.value = String(format: Constants.formatValue, Constants.amountText, amountValue.currency)
    }
}
