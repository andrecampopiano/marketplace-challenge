//
//  String.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 20/06/23.
//

import Foundation

extension String {
    func splitAndConvert<T, C: Converter>(_ separator: String, componentIndex: Int, using converter: C) -> T? where C.Input == String, C.Output == T {
        let components = self.components(separatedBy: separator)
        guard components.indices.contains(componentIndex) else { return nil }
        let component = components[componentIndex]
        return converter.convert(component)
    }
}
