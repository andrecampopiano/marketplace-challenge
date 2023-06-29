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
        viewController?.showCartFlow = showCartFlow
        self.router.setRootViewController(viewController)
    }
    
    private func showDetailsFlow(_ model: ProductModel?) {
        let controller = controllerFactory.instantiateDetailsController(model: model)
        controller?.showCartFlow = showCartFlow
        controller?.showCartFlowWithNewItem = showCartFlowWithNewItem
        controller?.addItemToCart = addItemToCart
        self.router.push(controller)
    }
    
    private func showCartFlow() {
        let controller = controllerFactory.instantiateCartController()
        self.router.present(controller)
    }
    
    private func showCartFlowWithNewItem(_ item: CartModel?) {
        let controller = controllerFactory.instantiateCartController()
        let viewModel = controller?.viewModel
        viewModel?.addItem(cart: item)
        self.router.present(controller)
    }
    
    private func addItemToCart(_ item: CartModel?) {
        let viewModel = controllerFactory.instantiateCartController()?.viewModel
        viewModel?.addItem(cart: item)
    }
}
