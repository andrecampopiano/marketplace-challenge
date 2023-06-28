//
//  DetailsControllerTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 13/06/23.
//

import CoreSwift
import Foundation
@testable import MarketplaceChallenge

private final class MockDetailsControllerViewModel: DetailsControllerViewModelProtocol {
    var model = Dynamic<ProductModel?>(nil)
    var productDetailsViewModel: ProductDetailsViewModelProtocol?
    var sizeViewModel: SizeComponentViewModel?
    
    init() {
        let file = FileRepresentation(withFileName: "product_item", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductResponse.self, from: data) else { return }
        self.model.value = ProductResponseMapper.map(response: response)
        sizeViewModel = SizeComponentViewModel(model: self.model.value?.sizes)
        productDetailsViewModel = ProductDetailsViewModel(model: self.model.value)
    }
    
    func setup(model: ProductResponse?) { }
    
    func addToCart() { }
}

final class DetailsControllerTests: BaseXCTest {
    
    // MARK: - Properties
    
    private var sut: DetailsController?
    private var viewModel: MockDetailsControllerViewModel?
    
    // MARK: - Override Methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        viewModel = nil
    }
    
    // MARK: - Tests Methods
    
    func test_snapshot() {
        makeSut()
        verifySnapshotView(delay: 2) {
            self.sut?.view
        }
    }
    
    // MARK: - Private Methods
    
    private func makeSut() {
        viewModel = MockDetailsControllerViewModel()
        sut = DetailsController.instantiate()
        sut?.viewModel = viewModel
        sut?.viewDidLoad()
        sut?.view.setNeedsLayout()
        sut?.view.layoutIfNeeded()
    }
}
