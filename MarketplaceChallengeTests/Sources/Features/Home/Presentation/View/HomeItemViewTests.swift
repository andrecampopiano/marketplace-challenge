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

private class MockHomeItemViewModel: HomeItemViewModelProtocol {
    
    var model = Dynamic<ProductResponse?>(nil)
    
    init() {
        let file = FileRepresentation(withFileName: "product_item", fileExtension: .json, fileBundle: Bundle(for: MarketplaceChallengeTests.self))
        guard let data = file.data,
              let response = try? JSONDecoder().decode(ProductResponse.self, from: data) else { return }
        model.value = response
    }
}

final class HomeItemViewTests: BaseXCTest, Elements {
    
    typealias ElementsId = HomeItemViewIdentifiers
    
    // MARK: - Elements
    
    private var containerView: UIView?
    private var titleLabel: UILabel?
    private var mainImageView: UIImageView?
    private var primaryButton: UIButton?
    private var originalPriceLabel: UILabel?
    private var priceLabel: UILabel?
    private var installmentsLabel: UILabel?
    
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
    
    func test_asserts_properties() {
        makeSut()
        XCTAssertEqual(titleLabel?.text, "VESTIDO TRANSPASSE BOW")
        XCTAssertEqual(primaryButton?.titleLabel?.text, "Comprar")
        XCTAssertEqual(originalPriceLabel?.text, "R$ 199,90")
        XCTAssertEqual(priceLabel?.text, "R$ 99,90")
        XCTAssertEqual(installmentsLabel?.text, "3x R$ 33,63")
        XCTAssertNotNil(containerView)
        XCTAssertNotNil(mainImageView)
    }
    
    func test_snapshot_with_default_values() {
        makeSut()
        sut?.frame = CGRect(x: .zero, y: .zero, width: 320, height: 196)
        verifySnapshotView(delay: 2) {
            self.sut
        }
    }
    
    // MARK: - Private Methods
    
    private func makeSut() {
        self.viewModel = MockHomeItemViewModel()
        guard let viewModel = viewModel else { return }
        sut = HomeItemView.instantiate(viewModel: viewModel)
        setupElements()
    }
    
    private func setupElements() {
        containerView = findElement(in: sut, andIdentifier: .containerView)
        titleLabel = findElement(in: sut, andIdentifier: .titleLabel)
        mainImageView = findElement(in: sut, andIdentifier: .mainImageView)
        primaryButton = findElement(in: sut, andIdentifier: .primaryButton)
        originalPriceLabel = findElement(in: sut, andIdentifier: .originalPriceLabel)
        priceLabel = findElement(in: sut, andIdentifier: .priceLabel)
        installmentsLabel = findElement(in: sut, andIdentifier: .installmentsLabel)
    }
}
