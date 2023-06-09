//
//  HomeViewModelTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
@testable import MarketplaceChallenge
import XCTest

private class MockHomeManagerWithSucces: HomeManagerProtocol {
    
    // MARK: - Public Methods
    
    func fetchProductList(completion: @escaping ProductListGetCompletion) {
        let file = FileRepresentation(withFileName: "product_list_success", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductListResponse.self, from: data) else { return }
        let model = ProductResponseMapper.map(responses: response.products)
        completion(.success(model))
    }
}

final class HomeViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    private var sut: HomeViewModel?
    private var manager: HomeManagerProtocol?
    
    // MARK: - Tests Methods
    
    func test_fetch_success() {
        let expectation = XCTestExpectation(description: "testing fetch with success")
        makeSut(manager: MockHomeManagerWithSucces())
        sut?.status.bind(skip: true) { status in
            if status == .loaded {
                XCTAssertNotNil(self.sut?.itemsViewModel)
                XCTAssertEqual(self.sut?.itemsViewModel?.count, 5)
                XCTAssertEqual(self.sut?.status.value, .loaded)
                expectation.fulfill()
            }
        }
        
        sut?.fetchProductList()
        wait(for: [expectation], timeout: 2)
    }
    
    // MARK: - Private Methods
    
    private func makeSut(manager: HomeManagerProtocol) {
        sut = HomeViewModel(manager: manager)
    }
}
