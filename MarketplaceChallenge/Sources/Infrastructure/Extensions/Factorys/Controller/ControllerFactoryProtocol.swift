//
//  ControllerFactoryProtocol.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import UIKit

protocol ControllerFactoryProtocol {
    func instantiateHomeController() -> HomeController?
    func instantiateCartController() -> CartController?
    func instantiateDetailsController(model: ProductModel?) -> DetailsController? 
}
