//
//  HomeControllerFactory.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import CoreSwift
import UIKit

class HomeControllerFactory: ControllerFactoryProtocol {
    func instantiate() -> UIViewController? {
        return HomeController.instantiate()
    }
}
