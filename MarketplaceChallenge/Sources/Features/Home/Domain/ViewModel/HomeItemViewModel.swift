//
//  HomeItemViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
import Foundation

protocol HomeItemViewModelProtocol {
    var model: Dynamic<ProductResponse?> { get }
}

final class HomeItemViewModel: HomeItemViewModelProtocol {
    
    // MARK: - Properties
    
    var model = Dynamic<ProductResponse?>(nil)
    
    // MARK: - Initialize
    
    init(model: ProductResponse) {
        self.model.value = model
    }
}
