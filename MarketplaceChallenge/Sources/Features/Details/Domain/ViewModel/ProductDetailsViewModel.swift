//
//  File.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import Foundation

protocol ProductDetailsViewModelProtocol {
    var model: Dynamic<ProductModel?> { get }
}

final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    var model = Dynamic<ProductModel?>(nil)
    
    init(model: ProductModel?) {
        self.model.value = model
    }
}
