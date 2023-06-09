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
    
    func fetchProductList()
}

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    var status = Dynamic<HomeStatus?>(nil)
    
    private var manager: HomeManagerProtocol?
    
    init(manager: HomeManagerProtocol = HomeManager()) {
        self.manager = manager
    }
    
    // MARK: - Public Methods
    
    func fetchProductList() {
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
        
    }
    
    private func handlerError(error: Error) {
        
    }
    
}
