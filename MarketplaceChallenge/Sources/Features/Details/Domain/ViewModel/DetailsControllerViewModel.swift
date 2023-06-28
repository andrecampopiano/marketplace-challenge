//
//  DetailsControllerViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift

protocol DetailsControllerViewModelProtocol {
    var model: Dynamic<ProductModel?> { get }
    var productDetailsViewModel: ProductDetailsViewModelProtocol? { get }
    var sizeViewModel: SizeComponentViewModel? { get }

    func addToCart()
}

final class DetailsControllerViewModel: DetailsControllerViewModelProtocol {
    
    var model = Dynamic<ProductModel?>(nil)
    var sizeViewModel: SizeComponentViewModel?
    var productDetailsViewModel: ProductDetailsViewModelProtocol?
    
    init(model: ProductModel?) {
        self.model.value = model
        self.productDetailsViewModel = ProductDetailsViewModel(model: model)
        self.sizeViewModel = SizeComponentViewModel(model: model?.sizes)
    }

    func addToCart() {}
}
