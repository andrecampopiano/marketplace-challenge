//
//  SizeComponentViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 20/06/23.
//

import CoreSwift
import Foundation

struct SizeComponentModel {
    var size: String?
}

protocol SizeComponentViewModelProtocol {
    var model: Dynamic<[SizeComponentModel]?> { get }
    
    func updateSelectedItem(position: Int)
}

final class SizeComponentViewModel: SizeComponentViewModelProtocol {
    
    var model = Dynamic<[SizeComponentModel]?>(nil)
    var itemSelected: SizeComponentModel?
    
    init(model: [SizeComponentModel]?) {
        self.model.value = model
    }
    
    // MARK: - Public Methods
    
    func updateSelectedItem(position: Int) {
        itemSelected = model.value?[position]
    }
}
