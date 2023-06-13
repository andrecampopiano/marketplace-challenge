//
//  File.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import Foundation

protocol ProductDetailsViewModelProtocol {
    var model: Dynamic<ProductResponse?> { get }
}

final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    var model = Dynamic<ProductResponse?>(nil)
    
    init(model: ProductResponse?) {
        self.model.value = model
    }
}
