//
//  HomeController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

import CoreSwift
import UIKit

class HomeController: UIViewController {
    
    // MARK: - Instantiate
    
    static func instantiate() -> HomeController {
        let viewController = HomeController()
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    // MARK: Private Methods
    
    func setupLayout() {
        view.backgroundColor = .gray
    }
}

