//
//  CoordinatorFactoryProtocol.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import CoreSwift
import Foundation

protocol CoordinatorFactoryProtocol {
    func makeHomeCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator
    func makeDetailsCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator
    func makeCartCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator
}
