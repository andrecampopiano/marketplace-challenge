//
//  HomeItemViewTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
import iOSSnapshotTestCase
@testable import MarketplaceChallenge
import XCTest

class HomeItemViewTests: BaseXCTest {
    
    // MARK: - Properties
    
    var sut: HomeItemView?
    var viewModel: HomeItemViewModelProtocol?
    
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
    
    func test_snapshot_with_default_values() {
        self.viewModel = MockHomeItemViewModel()
        makeSut()
        sut?.frame = CGRect(x: .zero, y: .zero, width: 320, height: 196)
        verifySnapshotView(delay: 2) {
            self.sut
        }
    }
    
    // MARK: - Private Methods
    
    private func makeSut() {
        guard let viewModel = viewModel else { return }
        sut = HomeItemView.instantiate(viewModel: viewModel)
    }
}

private class MockHomeItemViewModel: HomeItemViewModelProtocol {
    
    var model = Dynamic<ProductResponse?>(nil)
    
    init() {
        let file = FileRepresentation(withFileName: "product_item", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductResponse.self, from: data) else { return }
        model.value = response
    }
}
