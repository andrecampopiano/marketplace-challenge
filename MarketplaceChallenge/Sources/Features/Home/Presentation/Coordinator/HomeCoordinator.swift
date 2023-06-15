//
//  HomeCoordinator.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import CoreSwift
import Foundation

class HomeCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let controllerFactory: ControllerFactoryProtocol
    private var viewModel: HomeViewModelProtocol?
    
    // MARK: - Initialize
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol, viewModel: HomeViewModelProtocol? = HomeViewModel()) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.controllerFactory = controllerFactory
        self.viewModel = viewModel
    }
    
    // MARK: - Override Methods
    
    override func start() {
        self.showHomeViewController()
    }
    
    // MARK: - Private Methods
    
    private func showHomeViewController() {
        let viewController = self.controllerFactory.instantiateHomeController()
        viewController?.showDetailsFlow = showDetailsFlow
        self.router.setRootViewController(viewController)
    }
    
    private func showDetailsFlow(_ model: ProductResponse?) {
        let controller = controllerFactory.instantiateDetailsController(model: model)
        self.router.push(controller)
    }
}
