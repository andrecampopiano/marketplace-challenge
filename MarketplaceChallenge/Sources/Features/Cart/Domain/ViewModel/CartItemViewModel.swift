//
//  CartItemViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 28/06/23.
//

import CoreSwift
import Foundation

protocol CartItemViewModelProtocol {
    var model: CartItemModel? { get }
    var imageUrl: Dynamic<String?> { get }
    var title: Dynamic<String?> { get }
    var price: Dynamic<String?> { get }
    var quantity: Dynamic<Int?> { get }
    var amount: Dynamic<String?> { get }
    var size: Dynamic<String?> { get }
}

class CartItemViewModel: CartItemViewModelProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let formatValue: String = "%@ %@"
        static let amountText: String = "Valor Total:"
        static let priceText: String = "Valor por Unidade:"
    }
    
    // MARK: - Properties
    
    var model: CartItemModel?
    var imageUrl = Dynamic<String?>(nil)
    var title = Dynamic<String?>(nil)
    var price = Dynamic<String?>(nil)
    var quantity = Dynamic<Int?>(nil)
    var amount = Dynamic<String?>(nil)
    var size = Dynamic<String?>(nil)
    
    // MARK: - Initialize
    
    init(model: CartItemModel) {
        self.model = model
        setupDataSource(model: model)
    }
    
    // MARK: - Private Methods
    
    private func setupDataSource(model: CartItemModel) {
        title.value = model.title
        quantity.value = model.quantity
        imageUrl.value = model.image
        size.value = model.size
        setupPriceValue(value: model.priceItem ?? .zero)
        setupAmountValue(value: model.priceItem ?? .zero)
    }
    
    private func setupAmountValue(value: Double) {
        self.amount.value = String(format: Constants.formatValue, Constants.amountText, value.currency)
    }
    
    private func setupPriceValue(value: Double) {
        price.value = String(format: Constants.formatValue, Constants.priceText, value.currency)
    }
}
