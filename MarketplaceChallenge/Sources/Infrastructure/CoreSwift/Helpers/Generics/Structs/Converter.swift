//
//  Converter.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 15/06/23.
//

import Foundation

protocol Converter {
    associatedtype Input
    associatedtype Output
    func convert(_ input: Input) -> Output?
}

struct StringToIntConverter: Converter {
    func convert(_ input: String) -> Int? {
        return Int(input.trimmingCharacters(in: .whitespaces))
    }
}

struct StringToDoubleConverter: Converter {
    func convert(_ input: String) -> Double? {
        return Double(input.replacingOccurrences(of: ",", with: ".").trimmingCharacters(in: .whitespaces))
    }
}
