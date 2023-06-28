//
//  ControllerFactoryTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
@testable import MarketplaceChallenge
import XCTest

final class ControllerFactoryTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: ControllerFactory?
    
    // MARK: - Tests Methods
    
    func test_factory_not_nil() {
        makeSut()
        guard let viewController = sut?.instantiateHomeController() else { return }
        XCTAssertTrue(viewController.isKind(of: HomeController.self))
    }
    
    // MARK: - Private Methods
    
    private func makeSut() {
        let viewModel = CartViewModel()
        sut = ControllerFactory(cartViewModel: viewModel)
    }
}
