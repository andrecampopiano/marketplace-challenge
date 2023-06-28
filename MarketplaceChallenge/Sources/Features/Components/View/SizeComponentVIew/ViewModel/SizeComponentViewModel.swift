//
//  SizeComponentViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 20/06/23.
//

import Foundation

protocol SizeComponentViewModelProtocol {
    var model: [ProductSizeModel]? { get }
    
    func updateSelectedItem(position: Int)
}

final class SizeComponentViewModel: SizeComponentViewModelProtocol {
    
    var model: [ProductSizeModel]?
    var itemSelected: ProductSizeModel?
    
    init(model: [ProductSizeModel]?) {
        self.model = model
    }
    
    // MARK: - Public Methods
    
    func updateSelectedItem(position: Int) {
        itemSelected = model?[position]
    }
}
