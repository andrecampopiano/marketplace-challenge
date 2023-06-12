//
//  HomeControllerFactory.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import CoreSwift
import UIKit

class HomeControllerFactory: ControllerFactoryProtocol {
    
    private var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    func instantiate() -> UIViewController? {
        return HomeController.instantiate(viewModel: viewModel)
    }
}
