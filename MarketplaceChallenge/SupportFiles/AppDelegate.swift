//
//  AppDelegate.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let viewController = buildHomeController() else { return false }
        let navigationController = buildNavigationController(viewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
    
    private func buildHomeController() -> HomeController? {
        return HomeController.instantiate()
    }
    
    private func buildNavigationController(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.backgroundColor = .white
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        standard.backButtonAppearance = backButtonAppearance
        navigationController.navigationBar.standardAppearance = standard
        navigationController.navigationBar.scrollEdgeAppearance = standard
        navigationController.navigationBar.tintColor = .black
        return navigationController
    }
}

