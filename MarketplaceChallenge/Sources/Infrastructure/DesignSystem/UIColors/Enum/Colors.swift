//
//  Colors.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import UIKit

enum Colors: String {
    
    // MARK: - Neutral Colors
    
    case neutralDarkGrey
    case neutralBlack
    case neutralGrey
    case neutralWhite
    case neutralLightGrey
    
    // MARK: - Secoundary Colors
    
    case secondaryGreen
    case secondaryRed
    case secondaryDarkBlue
    case secondaryDarkGreen
    case secondaryLightGreen
    case secondaryLightYellow
    case secondaryNavy
    case secondaryYellow
    
    // MARK: - Primary Colors
    
    case primaryBlue
    case primaryArcticBlue
    case primaryLightBlue
    case primarySkyBlue
    
    var color: UIColor {
        UIColor(named: rawValue, in: .main, compatibleWith: .none) ?? .white
    }
}
