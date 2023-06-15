//
//  CartCoordinator.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 14/06/23.
//

import CoreSwift
import Foundation

final class CartCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let controllerFactory: ControllerFactoryProtocol
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.controllerFactory = controllerFactory
    }
    
    // MARK: - Override Methods
    
    override func start() {
        self.showCartController()
    }
    
    // MARK: - Private Methods
    
    private func showCartController() {
        let controller = controllerFactory.instantiateCartController()
        self.router.push(controller)
    }
}
