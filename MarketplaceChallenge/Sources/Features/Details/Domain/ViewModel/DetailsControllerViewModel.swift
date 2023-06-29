//
//  DetailsControllerViewModel.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift

protocol DetailsControllerViewModelProtocol {
    var model: Dynamic<ProductModel?> { get }
    var productDetailsViewModel: ProductDetailsViewModelProtocol? { get }
    var sizeViewModel: SizeComponentViewModel? { get }

    func addToCart() -> CartModel
}

final class DetailsControllerViewModel: DetailsControllerViewModelProtocol {
    
    var model = Dynamic<ProductModel?>(nil)
    var sizeViewModel: SizeComponentViewModel?
    var productDetailsViewModel: ProductDetailsViewModelProtocol?
    
    init(model: ProductModel?) {
        self.model.value = model
        self.productDetailsViewModel = ProductDetailsViewModel(model: model)
        self.sizeViewModel = SizeComponentViewModel(model: SizeComponentModelMapper.map(productsSizeModel: model?.sizes))
    }

    func addToCart() -> CartModel {
        
        let product = CartModelMapper.map(product: model.value)
        let productSize = model.value?.sizes?.first { $0.size == sizeViewModel?.itemSelected?.size }
        
        return CartModel(productVariant: CartProductVariantModel(sku: productSize?.sku,
                                                                 name: productSize?.size,
                                                                 quantity: 1,
                                                                 product: product))
    }
}

extension CartModelMapper {
    static func map(product: ProductModel?) -> CartProductModel {
        return CartProductModel(image: product?.image,
                                name: product?.name,
                                actualPrice: product?.actualPriceValue,
                                regularPrice: product?.regularPriceValue,
                                installmentsPrice: product?.installmentsPrice,
                                installmentsQuantity: product?.installmentsQuantity)
    }
}
