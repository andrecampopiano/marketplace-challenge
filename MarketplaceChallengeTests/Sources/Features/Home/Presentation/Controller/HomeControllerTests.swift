//
//  HomeControllerTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

import CoreSwift
import iOSSnapshotTestCase
@testable import MarketplaceChallenge
import XCTest

private class MockHomeViewModel: HomeViewModelProtocol {
    
    var status = Dynamic<HomeStatus?>(nil)
    var model = Dynamic<ProductListResponse?>(nil)
    var itemViewModel: [HomeItemViewModelProtocol]?
    
    func fetchProductList() {
        let file = FileRepresentation(withFileName: "product_list_success", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductListResponse.self, from: data) else { return }
        self.model.value = response
        self.status.value = .loaded
    }
}

final class HomeControllerTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: HomeController?
    private var viewModel: MockHomeViewModel? = MockHomeViewModel()
    
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
    
    func test_asset_properties() {
        makeSut(viewModel: viewModel)
        viewModel?.status.value = .loaded
        XCTAssertEqual(sut?.title, "Lista de Produtos")
    }
    
    func test_snapshot_with_succes() {
        makeSut(viewModel: viewModel)
        
        recordMode = true
        guard let sut = sut else { return }
        verifySnapshotView(delay: 2) {
            sut.view
        }
    }
    
    // MARK: Private Methods
    
    private func makeSut(viewModel: HomeViewModelProtocol?) {
        guard let viewModel = viewModel else { return }
        sut = HomeController.instantiate(viewModel: viewModel)
        sut?.viewDidLoad()
        addControllerToWindow(sut ?? UIViewController())
    }
}
