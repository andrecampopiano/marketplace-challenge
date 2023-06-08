//
//  UINavigationController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 07/06/23.
//

import UIKit

extension UINavigationController {
    static func instantiate() -> UINavigationController {
        let navigationController = UINavigationController()
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.backgroundColor = .neutralWhite
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        standard.backButtonAppearance = backButtonAppearance
        navigationController.navigationBar.standardAppearance = standard
        navigationController.navigationBar.scrollEdgeAppearance = standard
        navigationController.navigationBar.tintColor = .neutralBlack
        return navigationController
    }
}
