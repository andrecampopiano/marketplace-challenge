//
//  CGFloat.swift
//  MarketplaceChallengeTests
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import UIKit

extension CGFloat {
    // MARK: - Spacings

    /// Method responsible for get a default spacing (espaçamento)
    /// - Parameter size: Spacing size
    static func spacing(_ size: Size) -> CGFloat {
        return size.rawValue
    }

    /// Method responsible for get a default size (tamanho)
    /// - Parameter size: Spacing size
    static func size(_ size: Size) -> CGFloat {
        return size.rawValue
    }
    
    /// Method responsible for get a default size, exclusively for margins (margens)
    /// - Parameter size: Margin size - default = .medium (24.0)
    /// - Parameter convertResolutionTo: Bool - default = false
    static func margin(size: MarginSize = .medium, convertResolutionTo pixels: Bool = false) -> CGFloat {
        
        if pixels {
            return size.rawValue.pointsToPixel()
        }
        
        return size.rawValue
    }
    
    /// Method responsible to convert iOS points to  pixels
    func pointsToPixel() -> CGFloat {
        return self * UIScreen.main.scale
    }
}
