//
//  HomeViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
import Foundation

protocol HomeViewModelProtocol {
    
    var status: Dynamic<HomeStatus?> { get }
    var model: Dynamic<ProductListResponse?> { get }
    
    func fetchProductList()
}

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    
    var status = Dynamic<HomeStatus?>(nil)
    var model = Dynamic<ProductListResponse?>(nil)
    
    private var manager: HomeManagerProtocol?
    
    // MARK: - Initialize
    
    init(manager: HomeManagerProtocol = HomeManager()) {
        self.manager = manager
    }
    
    // MARK: - Public Methods
    
    func fetchProductList() {
        self.status.value = .loading
        self.manager?.fetchProductList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.handlerSuccess(model: model)
            case .failure(let error):
                self.handlerError(error: error)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func handlerSuccess(model: ProductListResponse) {
        self.model.value = model
        self.status.value = .loaded
    }
    
    private func handlerError(error: Error) {
        self.status.value = .error
    }
    
}
