//
//  DetailsCoordinator.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 14/06/23.
//

import CoreSwift

class DetailsCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let controllerFactory: ControllerFactoryProtocol
    private var viewModel: DetailsControllerViewModelProtocol?
    
    // MARK: - Initialize
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.controllerFactory = controllerFactory
    }
    
    // MARK: - Override Methods
    
    func start(model: ProductModel?) {
        super.start()
        showDetailsController(model: model)
    }
    
    // MARK: - Private Methods
    
    private func showDetailsController(model: ProductModel?) {
        let controller = controllerFactory.instantiateDetailsController(model: model)
        self.router.push(controller)
    }
}
