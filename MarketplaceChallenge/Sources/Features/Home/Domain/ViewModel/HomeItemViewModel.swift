//
//  HomeItemViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
import Foundation

protocol HomeItemViewModelProtocol {
    var model: Dynamic<ProductModel?> { get }
}

final class HomeItemViewModel: HomeItemViewModelProtocol {
    
    // MARK: - Properties
    
    var model = Dynamic<ProductModel?>(nil)
    
    // MARK: - Initialize
    
    init(model: ProductModel) {
        self.model.value = model
    }
}
