//
//  SizeComponentItemView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 13/06/23.
//

import CoreSwift
import UIKit

final class SizeComponentItemView: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .medium, size: .small)
        label.textColor = .neutralBlack
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Public Methods
    
    func setup(title: String?) {
        titleLabel.text = title
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupLayout() {
        self.borderColor = .neutralBlack
        self.borderWidth = 0.5
        setupTitleLabelLayout()
    }
    
    private func setupTitleLabelLayout() {
        addSubview(titleLabel)
        titleLabel.anchorFillSuperView()
    }
}
