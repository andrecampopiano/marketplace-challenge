//
//  HomeController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

import CoreSwift
import UIKit

final class HomeController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let navigationTitle: String = LocalizableBundle.homeControllerNavigationTitle.localize
    }
    
    // MARK: - Instantiate
    
    static func instantiate() -> HomeController {
        let viewController = HomeController()
        return viewController
    }
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: - Private Methods
    
    private func setupLayout() {
        view.backgroundColor = .gray
        title = Constants.navigationTitle
    }
}
