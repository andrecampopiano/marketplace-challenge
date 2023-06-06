//
//  HomeBusiness.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 06/06/23.
//

import CoreSwift
import Foundation

typealias ProductListGetCompletion = (Result<ProductListResponse, Error>) -> Void

protocol HomeBusinessProtocol {
    func handlerProductListGetCompletion(result: NetworkingResponse, completion: @escaping ProductListGetCompletion)
}

struct HomeBusiness: HomeBusinessProtocol {
    
    // MARK: - Constants
    
    private enum Constants {
        static let parseErrorDescription: String = "Error decoding data"
    }
    
    // MARK: - Public Methods
    func handlerProductListGetCompletion(result: NetworkingResponse, completion: @escaping ProductListGetCompletion) {
        do {
            guard let response = try result().data else {
                return completion(.failure(BaseError.parse(Constants.parseErrorDescription)))
            }
            let model = try JSONDecoder().decode(ProductListResponse.self, from: response)
            completion(.success(model))
        } catch {
            completion(.failure(error))
        }
    }
}
