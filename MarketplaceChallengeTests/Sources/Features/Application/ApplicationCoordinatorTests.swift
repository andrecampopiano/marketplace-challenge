//
//  ApplicationCoordinatorTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
@testable import MarketplaceChallenge
import UIKit
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
        let vc = self.controllerFactory.instantiate()
        self.router.push(vc)
    }
}

private final class MockControllerFactoryProtocol: ControllerFactoryProtocol {
    
    var controller: UIViewController?
    
    func instantiate() -> UIViewController? {
        controller = UIViewController()
        controller?.title = "Teste Application Coordinator"
        return controller
    }
}

private final class MockCoordinatorFactory: CoordinatorFactoryProtocol {
    
    var coordinator: MockBaseCoordinator?
    
    func makeCoordinator(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, controllerFactory: ControllerFactoryProtocol) -> BaseCoordinator {
        coordinator = MockBaseCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
        return coordinator ?? MockBaseCoordinator(router: router, coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
    }
}

final class ApplicationCoordinatorTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: ApplicationCoordinator?
    private var coordinatorFactory: MockCoordinatorFactory?
    private var controllerFactory: MockControllerFactoryProtocol?
    
    // MARK: - Tests Methods
    
    func test_assert_properties() {
        coordinatorFactory = MockCoordinatorFactory()
        controllerFactory = MockControllerFactoryProtocol()
        XCTAssertNil(coordinatorFactory?.coordinator)
        makeSut(coordinatorFactory: coordinatorFactory, controllerFactory: controllerFactory)
        sut?.start()
        XCTAssertNotNil(coordinatorFactory?.coordinator)
        XCTAssertEqual(coordinatorFactory?.coordinator?.isTestable, true)
        XCTAssertEqual(controllerFactory?.controller?.title, "Teste Application Coordinator")
    }
    
    private func makeSut(coordinatorFactory: CoordinatorFactoryProtocol?, controllerFactory: ControllerFactoryProtocol?) {
        guard let coordinatorFactory = coordinatorFactory,
              let controllerFactory = controllerFactory else { return }
        sut = ApplicationCoordinator(router: Router(rootController: UINavigationController()),
                                     coordinatorFactory: coordinatorFactory,
                                     controllerFactory: controllerFactory)
    }
}
