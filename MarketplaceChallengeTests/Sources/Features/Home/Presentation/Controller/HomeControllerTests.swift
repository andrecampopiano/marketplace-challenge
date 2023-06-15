//
//  HomeControllerTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

import CoreSwift
import Foundation
@testable import MarketplaceChallenge
import XCTest

private class HomeManagerMock: HomeManagerProtocol {
    func fetchProductList(completion: @escaping ProductListGetCompletion) {
        let file = FileRepresentation(withFileName: "product_list_success", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductListResponse.self, from: data) else { return }
        completion(.success(response))
    }
}

final class HomeControllerTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: HomeController?
    private var viewModel: HomeViewModelProtocol?
    
    // MARK: - Override Methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        viewModel = nil
    }
    
    // MARK: - Test Methods
    
    func test_assert_properties() {
        viewModel = HomeViewModel(manager: HomeManagerMock())
        makeSut(viewModel: viewModel)
        viewModel?.status.value = .loaded
        XCTAssertEqual(sut?.title, "Lista de Produtos")
    }
    
    func test_snapshot_with_succes() {
        viewModel = HomeViewModel(manager: HomeManagerMock())
        makeSut(viewModel: viewModel)
        guard let sut = sut else { return }
        verifySnapshotView(delay: 2) {
            sut.view
        }
    }
    
    // MARK: Private Methods
    
    private func makeSut(viewModel: HomeViewModelProtocol?) {
        sut = HomeController.instantiate()
        sut?.viewModel = viewModel
        sut?.viewDidLoad()
        addControllerToWindow(sut ?? UIViewController())
    }
}
