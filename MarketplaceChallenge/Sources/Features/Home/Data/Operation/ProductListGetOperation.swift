//
//  ProductListGetOperation.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import CoreSwift
import Foundation

final class ProductListGetOperation: NetworkingOperation {
    
    // MARK: Properties
    
    private var business: HomeBusinessProtocol?
    private var completion: ProductListGetCompletion
    
    // MARK: Initialize
    
    required init(provider: ApiProviderProtocol? = nil, business: HomeBusinessProtocol? = nil, completion: @escaping ProductListGetCompletion) {
        self.business = business
        self.completion = completion
        super.init(provider: provider)
    }
    
    override func main() {
        super.main()
        provider?.baseRequest(requestData: setupRequestData()) { [weak self] result in
            guard let self = self else { return }
            self.business?.handlerProductListGetCompletion(result: result, completion: self.completion)
            self.finish()
        }
    }
    
    private func setupRequestData() -> NetworkingRequestData {
        return NetworkingRequestData(url: ApplicationConstants.PathApi().productList,
                                     httpMethod: .get)
    }
}
