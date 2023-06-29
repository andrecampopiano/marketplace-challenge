//
//  SizeComponentModelMapper.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 28/06/23.
//

import Foundation

enum SizeComponentModelMapper {
    static func map(prodcutSizeModel: ProductSizeModel) -> SizeComponentModel {
        return SizeComponentModel(size: prodcutSizeModel.size)
    }
    
    static func map(productsSizeModel: [ProductSizeModel]?) -> [SizeComponentModel]? {
        return productsSizeModel?.map { map(prodcutSizeModel: $0) }
    }
}
