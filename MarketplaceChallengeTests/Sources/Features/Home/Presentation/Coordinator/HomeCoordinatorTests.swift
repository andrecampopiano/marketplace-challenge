//
//  HomeCoordinatorTests.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
@testable import MarketplaceChallenge
import XCTest

private final class MockBaseCoordinator: BaseCoordinator {
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let controllerFactory: ControllerFactoryProtocol
    
    var isTestable = false
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.controllerFactory = controllerFactory
        self.isTestable = true
    }
    
    override func start() {
        let vc = self.controllerFactory.instantiateHomeController()
        self.router.push(vc)
    }
}

private final class MockCoordinatorFactory: CoordinatorFactoryProtocol {
    func makeHomeCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        return MockBaseCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
    
    func makeDetailsCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        return MockBaseCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
    
    func makeCartCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        return MockBaseCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
}

private final class MockControllerFactory: ControllerFactoryProtocol {
    
    var controller: UIViewController?
    
    func instantiateHomeController() -> HomeController? {
        return instantiate() as? HomeController
    }
    
    func instantiateCartController() -> CartController? {
        return instantiate() as? CartController
    }
    
    func instantiateDetailsController(model: ProductModel?) -> DetailsController? {
        return instantiate() as? DetailsController
    }
    
    func instantiate() -> UIViewController? {
        controller = UIViewController()
        controller?.title = "Test Home Coordinator Flow"
        return controller
    }
}

final class HomeCoordinatorTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: BaseCoordinator?
    private var coordinatorFactory: MockCoordinatorFactory?
    private var controllerFactory: MockControllerFactory?
    
    // MARK: - Test Methods
    
    func test_home_coordinator_factory_call() {
        controllerFactory = MockControllerFactory()
        coordinatorFactory = MockCoordinatorFactory()
        makeSut(coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
        sut?.start()
        XCTAssertEqual(controllerFactory?.controller?.title, "Test Home Coordinator Flow")
    }
    
    // MARK: - Private Methods
    
    private func makeSut(coordinatorFactory: MockCoordinatorFactory?, controllerFactory: MockControllerFactory?) {
        guard let controllerFactory = controllerFactory,
              let coordinatorFactory = coordinatorFactory else { return }
        sut = HomeCoordinator(router: Router(rootController: UINavigationController()),
                              coordinatorFactory: coordinatorFactory,
                              controllerFactory: controllerFactory)
    }
}
