//
//  ButtonBuyFooterViewTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

@testable import MarketplaceChallenge
import XCTest

final class ButtonBuyFooterViewTests: BaseXCTest, Elements {
    
    typealias ElementsId = ButtonBuyFooterViewIdentifiers
    
    // MARK: - Elements
    
    private var containerView: UIStackView?
    private var primaryButton: UIButton?
    private var secoundaryButton: UIButton?
    
    // MARK: - Properties
    
    private var sut: ButtonBuyFooterView?
    private var view: UIView?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: - Tests Methods
    
    func test_all_buttons_show_snapshot() {
        makeSut()
        XCTAssertEqual(primaryButton?.titleLabel?.text, "Adicionar ao Carrinho")
        XCTAssertEqual(secoundaryButton?.titleLabel?.text, "Comprar")
        verifySnapshotView(delay: 2) {
            self.sut
        }
    }
    
    // MARK: - Private Methods
    
    private func makeSut() {
        let frame = CGRect(x: .zero, y: .zero, width: 320, height: .spacing(.large))
        sut = ButtonBuyFooterView.instantiate(frame: frame)
        sut?.layoutIfNeeded()
        setupElements()
    }
    
    private func setupElements() {
        containerView = findElement(in: sut, andIdentifier: .containerView)
        primaryButton = findElement(in: sut, andIdentifier: .primaryButton)
        secoundaryButton = findElement(in: sut, andIdentifier: .secoundaryButton)
    }
}
