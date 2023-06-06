//
//  HomeControllerTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

@testable import MarketplaceChallenge
import XCTest

final class HomeControllerTests: XCTestCase {
    
    // MARK: - Properties
    
    private var sut: HomeController?
    
    // MARK: - Test Methods
    
    func test_properties_nil() {
        makeSut()
        XCTAssertNil(sut?.title)
    }
    
    func test_asset_properties() {
        makeSut()
        sut?.viewDidLoad()
        XCTAssertEqual(sut?.title, "Lista de Produtos")
    }
    
    // MARK: Private Methods
    
    private func makeSut() {
        sut = HomeController.instantiate()
    }
}
