//
//  UICollectionView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 13/06/23.
//

import UIKit

extension UICollectionView {
    
    public func registerCell<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(T.self, forCellWithReuseIdentifier: cellType.className)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.className, for: indexPath) as? T else {
            fatalError("Could not dequeue cell of class \(cellType.className).")
        }
        return cell
    }
}
