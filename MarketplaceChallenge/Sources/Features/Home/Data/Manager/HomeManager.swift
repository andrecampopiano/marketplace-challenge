//
//  HomeManager.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import CoreSwift
import Foundation

protocol HomeManagerProtocol {
    func fetchProductList(completion: @escaping ProductListGetCompletion)
}

final class HomeManager: BaseManager, HomeManagerProtocol {
    
    // MARK: - Properties
    
    private var provider: ApiProviderProtocol?
    private var business: HomeBusinessProtocol?
    
    required init(provider: ApiProviderProtocol? = nil, business: HomeBusinessProtocol = HomeBusiness()) {
        self.provider = provider
        self.business = business
        super.init()
    }
    
    func fetchProductList(completion: @escaping ProductListGetCompletion) {
        cancelAllOperations()
        let operation = ProductListGetOperation(provider: provider, business: business, completion: completion)
        addOperation(operation)
    }
}
