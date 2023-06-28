//
//  ProductDetailsViewTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import iOSSnapshotTestCase
@testable import MarketplaceChallenge
import XCTest

private final class MockProductDetailsViewModel: ProductDetailsViewModelProtocol {
    var model = Dynamic<ProductModel?>(nil)
    
    init() {
        let file = FileRepresentation(withFileName: "product_item", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductResponse.self, from: data) else { return }
        self.model.value = ProductResponseMapper.map(response: response)
    }
}

final class ProductDetailsViewTests: BaseXCTest, Elements {
    
    typealias ElementsId = ProductDetailsViewIdentifiers
    
    // MARK: - Elements
    
    private var containerView: UIView?
    private var titleLabel: UILabel?
    private var originalPriceLabel: UILabel?
    private var priceLabel: UILabel?
    private var installmentsLabel: UILabel?
    
    // MARK: - Properties
    
    private var sut: ProductDetailsView?
    
    // MARK: - Override Methos
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: - Tests Methods
    
    func test_snapshot() {
        makeSut()
        XCTAssertEqual(titleLabel?.text, "VESTIDO TRANSPASSE BOW")
        XCTAssertEqual(originalPriceLabel?.text, "R$ 199,90")
        XCTAssertEqual(priceLabel?.text, "R$ 99,90")
        XCTAssertEqual(installmentsLabel?.text, "3x R$ 33,63")
        verifySnapshotView {
            self.sut
        }
    }
    
    // MARK: - Private Methods
    
    private func makeSut() {
        let frame = CGRect(x: .zero, y: .zero, width: 320, height: 100)
        let viewModel = MockProductDetailsViewModel()
        sut = ProductDetailsView(frame: frame)
        sut?.setup(viewModel: viewModel)
        sut?.layoutIfNeeded()
        setupElements()
    }
    
    private func setupElements() {
        containerView = findElement(in: sut, andIdentifier: .containerView)
        titleLabel = findElement(in: sut, andIdentifier: .titleLabel)
        originalPriceLabel = findElement(in: sut, andIdentifier: .originalPriceLabel)
        priceLabel = findElement(in: sut, andIdentifier: .priceLabel)
        installmentsLabel = findElement(in: sut, andIdentifier: .installmentsLabel)
    }
}
