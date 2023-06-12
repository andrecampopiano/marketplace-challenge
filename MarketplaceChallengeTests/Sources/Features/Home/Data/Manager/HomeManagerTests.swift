//
//  HomeManagerTests.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import CoreSwift
@testable import MarketplaceChallenge
import XCTest

final class HomeManagerTests: XCTestCase {
    
    // MARK: - Properties
    
    private var sut: HomeManager?
    private var provider: ApiProviderMock?
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        provider = nil
    }
    
    // MARK: - Tests Methods
    
    func test_fetch_product_list_with_success() {
        let expectetion = XCTestExpectation()
        makeSut(fileName: "product_list_success")
        sut?.fetchProductList { result in
            switch result {
            case .success(let model):
                self.assetsProductList(model: model)
                expectetion.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectetion], timeout: 2)
    }
    
    // MARK: - Private Methods
    
    private func assetsProductList(model: ProductListResponse) {
        XCTAssertNotNil(model)
        XCTAssertEqual(model.products?.count, 5)
        assetFirstProduct(model: model.products?[0])
        assetSecoundProduct(model: model.products?[1])
        assetThirdProduct(model: model.products?[2])
        assetFourthProduct(model: model.products?[3])
    }
    
    private func assetFirstProduct(model: ProductResponse?) {
        XCTAssertEqual(model?.name, "VESTIDO TRANSPASSE BOW")
        XCTAssertEqual(model?.style, "20002605")
        XCTAssertEqual(model?.codeColor, "20002605_613")
        XCTAssertEqual(model?.colorSlug, "tapecaria")
        XCTAssertEqual(model?.color, "TAPEÇARIA")
        XCTAssertEqual(model?.onSale, false)
        XCTAssertEqual(model?.regularPrice, "R$ 199,90")
        XCTAssertEqual(model?.actualPrice, "R$ 199,90")
        XCTAssertEqual(model?.discountPercentage, "")
        XCTAssertEqual(model?.installments, "3x R$ 66,63")
        XCTAssertEqual(model?.image, "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912")
        
        XCTAssertEqual(model?.sizes?.count, 5)
        XCTAssertEqual(model?.sizes?[0].available, false)
        XCTAssertEqual(model?.sizes?[0].size, "PP")
        XCTAssertEqual(model?.sizes?[0].sku, "5807_343_0_PP")
        XCTAssertEqual(model?.sizes?[1].available, true)
        XCTAssertEqual(model?.sizes?[1].size, "P")
        XCTAssertEqual(model?.sizes?[1].sku, "5807_343_0_P")
        XCTAssertEqual(model?.sizes?[2].available, true)
        XCTAssertEqual(model?.sizes?[2].size, "M")
        XCTAssertEqual(model?.sizes?[2].sku, "5807_343_0_M")
        XCTAssertEqual(model?.sizes?[3].available, true)
        XCTAssertEqual(model?.sizes?[3].size, "G")
        XCTAssertEqual(model?.sizes?[3].sku, "5807_343_0_G")
        XCTAssertEqual(model?.sizes?[4].available, false)
        XCTAssertEqual(model?.sizes?[4].size, "GG")
        XCTAssertEqual(model?.sizes?[4].sku, "5807_343_0_GG")
    }
    
    private func assetSecoundProduct(model: ProductResponse?) {
        XCTAssertEqual(model?.name, "REGATA ALCINHA FOLK")
        XCTAssertEqual(model?.style, "20002570")
        XCTAssertEqual(model?.codeColor, "20002570_614")
        XCTAssertEqual(model?.colorSlug, "preto")
        XCTAssertEqual(model?.color, "PRETO")
        XCTAssertEqual(model?.onSale, false)
        XCTAssertEqual(model?.regularPrice, "R$ 99,90")
        XCTAssertEqual(model?.actualPrice, "R$ 99,90")
        XCTAssertEqual(model?.discountPercentage, "")
        XCTAssertEqual(model?.installments, "3x R$ 33,30")
        XCTAssertEqual(model?.image, "https://d3l7rqep7l31az.cloudfront.net/images/products/20002570_002_catalog_1.jpg?1459948578")
        
        XCTAssertEqual(model?.sizes?.count, 5)
        XCTAssertEqual(model?.sizes?[0].available, true)
        XCTAssertEqual(model?.sizes?[0].size, "PP")
        XCTAssertEqual(model?.sizes?[0].sku, "5723_40130843_0_PP")
        XCTAssertEqual(model?.sizes?[1].available, true)
        XCTAssertEqual(model?.sizes?[1].size, "P")
        XCTAssertEqual(model?.sizes?[1].sku, "5723_40130843_0_P")
        XCTAssertEqual(model?.sizes?[2].available, true)
        XCTAssertEqual(model?.sizes?[2].size, "M")
        XCTAssertEqual(model?.sizes?[2].sku, "5723_40130843_0_M")
        XCTAssertEqual(model?.sizes?[3].available, true)
        XCTAssertEqual(model?.sizes?[3].size, "G")
        XCTAssertEqual(model?.sizes?[3].sku, "5723_40130843_0_G")
        XCTAssertEqual(model?.sizes?[4].available, true)
        XCTAssertEqual(model?.sizes?[4].size, "GG")
        XCTAssertEqual(model?.sizes?[4].sku, "5723_40130843_0_GG")
    }
    
    private func assetThirdProduct(model: ProductResponse?) {
        XCTAssertEqual(model?.name, "TOP CROPPED SUEDE")
        XCTAssertEqual(model?.style, "20002575")
        XCTAssertEqual(model?.codeColor, "20002575_035")
        XCTAssertEqual(model?.colorSlug, "caramelo")
        XCTAssertEqual(model?.color, "CARAMELO")
        XCTAssertEqual(model?.onSale, false)
        XCTAssertEqual(model?.regularPrice, "R$ 129,90")
        XCTAssertEqual(model?.actualPrice, "R$ 129,90")
        XCTAssertEqual(model?.discountPercentage, "")
        XCTAssertEqual(model?.installments, "3x R$ 43,30")
        XCTAssertEqual(model?.image, "https://d3l7rqep7l31az.cloudfront.net/images/products/20002575_027_catalog_1.jpg?1459537946")
        XCTAssertEqual(model?.sizes?.count, 5)
        XCTAssertEqual(model?.sizes?[0].available, false)
        XCTAssertEqual(model?.sizes?[0].size, "PP")
        XCTAssertEqual(model?.sizes?[0].sku, "5733_1000054_0_PP")
        XCTAssertEqual(model?.sizes?[1].available, true)
        XCTAssertEqual(model?.sizes?[1].size, "P")
        XCTAssertEqual(model?.sizes?[1].sku, "5733_1000054_0_P")
        XCTAssertEqual(model?.sizes?[2].available, true)
        XCTAssertEqual(model?.sizes?[2].size, "M")
        XCTAssertEqual(model?.sizes?[2].sku, "5733_1000054_0_M")
        XCTAssertEqual(model?.sizes?[3].available, true)
        XCTAssertEqual(model?.sizes?[3].size, "G")
        XCTAssertEqual(model?.sizes?[3].sku, "5733_1000054_0_G")
        XCTAssertEqual(model?.sizes?[4].available, false)
        XCTAssertEqual(model?.sizes?[4].size, "GG")
        XCTAssertEqual(model?.sizes?[4].sku, "5733_1000054_0_GG")
    }
    
    private func assetFourthProduct(model: ProductResponse?) {
        XCTAssertEqual(model?.name, "BATA DECOTE FLUID")
        XCTAssertEqual(model?.style, "20002581")
        XCTAssertEqual(model?.codeColor, "20002581_614")
        XCTAssertEqual(model?.colorSlug, "mini-folk")
        XCTAssertEqual(model?.color, "MINI FOLK")
        XCTAssertEqual(model?.onSale, false)
        XCTAssertEqual(model?.regularPrice, "R$ 149,90")
        XCTAssertEqual(model?.actualPrice, "R$ 149,90")
        XCTAssertEqual(model?.discountPercentage, "")
        XCTAssertEqual(model?.installments, "3x R$ 49,97")
        XCTAssertEqual(model?.image, "https://d3l7rqep7l31az.cloudfront.net/images/products/20002581_614_catalog_1.jpg?1459536611")
        XCTAssertEqual(model?.sizes?.count, 5)
        XCTAssertEqual(model?.sizes?[0].available, false)
        XCTAssertEqual(model?.sizes?[0].size, "PP")
        XCTAssertEqual(model?.sizes?[0].sku, "5749_341_0_PP")
        XCTAssertEqual(model?.sizes?[1].available, true)
        XCTAssertEqual(model?.sizes?[1].size, "P")
        XCTAssertEqual(model?.sizes?[1].sku, "5749_341_0_P")
        XCTAssertEqual(model?.sizes?[2].available, false)
        XCTAssertEqual(model?.sizes?[2].size, "M")
        XCTAssertEqual(model?.sizes?[2].sku, "5749_341_0_M")
        XCTAssertEqual(model?.sizes?[3].available, true)
        XCTAssertEqual(model?.sizes?[3].size, "G")
        XCTAssertEqual(model?.sizes?[3].sku, "5749_341_0_G")
        XCTAssertEqual(model?.sizes?[4].available, true)
        XCTAssertEqual(model?.sizes?[4].size, "GG")
        XCTAssertEqual(model?.sizes?[4].sku, "5749_341_0_GG")
    }

    private func makeSut(fileName: String, responseStatus: HttpResponseStatus = .okay) {
        provider = ApiProviderMock(fileName: fileName, fileBundle: Bundle(for: MarketplaceChallengeTests.self), responseStatus: responseStatus)
        sut = HomeManager(provider: provider)
    }
}
