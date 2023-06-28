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
    var itemsViewModel: [HomeItemViewModelProtocol]? { get }
    
    func fetchProductList()
    func getItemViewModel(row: Int) -> HomeItemViewModelProtocol?
}

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    
    var status = Dynamic<HomeStatus?>(nil)
    var itemsViewModel: [HomeItemViewModelProtocol]?
    
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
    
    func getItemViewModel(row: Int) -> HomeItemViewModelProtocol? {
        return itemsViewModel?[row]
    }
    
    // MARK: - Private Methods
    
    private func handlerSuccess(model: [ProductModel]?) {
        setupItemViewModel(products: model)
        self.status.value = .loaded
    }
    
    private func handlerError(error: Error) {
        self.status.value = .error
    }
    
    private func setupItemViewModel(products: [ProductModel]?) {
        self.itemsViewModel = []
        guard let products = products else { return }
        for item in products {
            self.itemsViewModel?.append(HomeItemViewModel(model: item))
        }
    }
}
