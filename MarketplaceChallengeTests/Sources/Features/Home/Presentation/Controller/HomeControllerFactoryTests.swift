//
//  HomeControllerFactoryTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
@testable import MarketplaceChallenge
import XCTest

private final class MockHomeViewModel: HomeViewModelProtocol {
    var status = Dynamic<HomeStatus?>(nil)
    
    var itemsViewModel: [HomeItemViewModelProtocol]?
    
    func fetchProductList() { }
    
    func getItemViewModel(row: Int) -> MarketplaceChallenge.HomeItemViewModelProtocol? { return nil }
}

final class HomeControllerFactoryTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: HomeControllerFactory?
    
    // MARK: - Tests Methods
    
    func test_factory_not_nil() {
        sut = HomeControllerFactory(viewModel: MockHomeViewModel())
        guard let viewController = sut?.instantiate() else { return }
        XCTAssertTrue(viewController.isKind(of: HomeController.self))
    }
}
