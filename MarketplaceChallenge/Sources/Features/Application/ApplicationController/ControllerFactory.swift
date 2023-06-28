//
//  ControllerFactory.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 14/06/23.
//

import CoreSwift
import UIKit

class ControllerFactory: ControllerFactoryProtocol {
    
    private var cartViewModel: CartViewModelProtocol?
    
    init(cartViewModel: CartViewModelProtocol?) {
        self.cartViewModel = cartViewModel
    }
    
    func instantiateCartController() -> CartController? {
        let controller = CartController.instantiate()
        controller.viewModel = cartViewModel
        return controller
    }
    
    func instantiateHomeController() -> HomeController? {
        let controller = HomeController.instantiate()
        controller.viewModel = HomeViewModel()
        return controller
    }
    
    func instantiateDetailsController(model: ProductModel?) -> DetailsController? {
        let controller = DetailsController.instantiate()
        controller.viewModel = DetailsControllerViewModel(model: model)
        
        return controller
    }
}
