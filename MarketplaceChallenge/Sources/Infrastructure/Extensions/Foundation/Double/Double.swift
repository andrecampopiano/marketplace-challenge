//
//  Double.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 29/06/23.
//

import Foundation

extension Double {
    
    private enum CurrencyConstants {
        static let localePtBR: String = "pt-BR"
        static let minimumFractionDigits: Int = 2
        static let maximumFractionDigits: Int = 2
    }

    public var currency: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: CurrencyConstants.localePtBR)
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = CurrencyConstants.minimumFractionDigits
        formatter.maximumFractionDigits = CurrencyConstants.maximumFractionDigits
        return formatter.string(from: NSNumber(value: self)) ?? String()
    }
}
