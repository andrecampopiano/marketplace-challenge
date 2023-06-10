//
//  LocalizableBundle.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import CoreSwift
import Foundation

enum LocalizableBundle: String {
    
    case homeControllerNavigationTitle
    
    // MARK: - HomeItemView
    
    case homeItemViewPrimaryButtonName
    
    var localize: String {
        return rawValue.localize(bundle: .main)
    }
}
