//
//  CartController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 14/06/23.
//

import UIKit

final class CartController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: CartViewModelProtocol?
    
    // MARK: - Instantiate
    
    static func instantiate() -> CartController {
        let controller = CartController()
        return controller
    }
}
