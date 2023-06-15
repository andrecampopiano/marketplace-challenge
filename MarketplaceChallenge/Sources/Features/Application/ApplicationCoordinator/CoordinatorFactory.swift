//
//  CoordinatorFactory.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import CoreSwift
import UIKit

class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeHomeCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        return HomeCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
    
    func makeDetailsCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        return DetailsCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
    
    func makeCartCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        return CartCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
}
