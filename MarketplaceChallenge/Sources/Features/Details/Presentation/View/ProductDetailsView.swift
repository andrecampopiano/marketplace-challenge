//
//  ProductDetailsView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import UIKit

enum ProductDetailsViewIdentifiers: String {
    case containerView = "productDetailsViewIdentifiers_containerView_id"
    case titleLabel = "productDetailsViewIdentifiers_titleLabel_id"
    case originalPriceLabel = "productDetailsViewIdentifiers_originalPriceLabel_id"
    case priceLabel = "productDetailsViewIdentifiers_priceLabel_id"
    case installmentsLabel = "productDetailsViewIdentifiers_installmentsLabel_id"
}

final class ProductDetailsView: UIView {
    
    // MARK: - Properties
    
    private var viewModel: ProductDetailsViewModelProtocol?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutralLightGrey
        view.roundCorners(corners: [.topLeft, .topRight], radius: .size(.extraSmall))
        view.accessibilityIdentifier = ProductDetailsViewIdentifiers.containerView.rawValue
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .regular, size: .medium)
        label.textColor = .neutralBlack
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.accessibilityIdentifier = ProductDetailsViewIdentifiers.titleLabel.rawValue
        return label
    }()
    
    private lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font = UIFont(name: .light, size: .extraMinimum)
        label.textColor = .neutralBlack
        label.accessibilityIdentifier = ProductDetailsViewIdentifiers.originalPriceLabel.rawValue
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .neutralBlack
        label.font = UIFont(name: .light, size: .minimum)
        label.accessibilityIdentifier = ProductDetailsViewIdentifiers.priceLabel.rawValue
        return label
    }()
    
    private lazy var installmentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .neutralBlack
        label.font = UIFont(name: .light, size: .small)
        label.accessibilityIdentifier = ProductDetailsViewIdentifiers.installmentsLabel.rawValue
        return label
    }()
    
    // MARK: - Instantiate
    
    static func instantiate(frame: CGRect = .zero) -> ProductDetailsView {
        let view = ProductDetailsView(frame: frame)
        return view
    }
    
    // MARK: - Public Methods
    
    func setup(viewModel: ProductDetailsViewModelProtocol?) {
        self.viewModel = viewModel
        bindElements()
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func bindElements() {
        viewModel?.model.bind { [weak self] model in
            guard let self = self else { return }
            self.titleLabel.text = model?.name
            self.originalPriceLabel.text = model?.regularPrice
            self.priceLabel.text = model?.actualPrice
            self.installmentsLabel.text = model?.installments
        }
    }
    
    private func setupLayout() {
        backgroundColor = .neutralWhite
        setupContainerViewLayout()
        setupTitleLabelLayout()
        setupInstallmentsLabelLayout()
        setupPriceLabelLayout()
        setupOriginalPriceLabelLayout()
    }
    
    private func setupContainerViewLayout() {
        addSubview(containerView)
        containerView.anchor(left: safeLeftAnchor,
                             right: safeRightAnchor)
        containerView.anchor(top: safeTopAnchor,
                             bottom: safeBottomAnchor)
    }
    
    private func setupTitleLabelLayout() {
        containerView.addSubview(titleLabel)
        titleLabel.anchor(height: .size(.small))
        titleLabel.anchor(top: containerView.safeTopAnchor,
                          paddingTop: .spacing(.extraSmall))
        titleLabel.anchor(left: containerView.safeLeftAnchor,
                          right: containerView.safeRightAnchor,
                          paddingLeft: .spacing(.small),
                          paddingRight: .spacing(.small))
    }
    
    private func setupOriginalPriceLabelLayout() {
        containerView.addSubview(originalPriceLabel)
        originalPriceLabel.anchor(height: .size(.smaller))
        originalPriceLabel.anchor(top: titleLabel.safeBottomAnchor,
                                  bottom: priceLabel.safeTopAnchor,
                                  paddingTop: .spacing(.medium),
                                  paddingBottom: .spacing(.nano))
        originalPriceLabel.anchor(left: installmentsLabel.safeLeftAnchor,
                                  right: installmentsLabel.safeRightAnchor)
    }
    
    private func setupPriceLabelLayout() {
        containerView.addSubview(priceLabel)
        priceLabel.anchor(height: .size(.smaller))
        priceLabel.anchor(left: installmentsLabel.safeLeftAnchor,
                          right: installmentsLabel.safeRightAnchor)
        priceLabel.anchor(bottom: installmentsLabel.safeTopAnchor,
                          paddingBottom: .spacing(.nano))
    }
    
    private func setupInstallmentsLabelLayout() {
        containerView.addSubview(installmentsLabel)
        installmentsLabel.anchor(height: .size(.small))
        installmentsLabel.anchor(left: containerView.safeLeftAnchor,
                                 right: containerView.safeRightAnchor,
                                 paddingLeft: .spacing(.medium),
                                 paddingRight: .spacing(.medium))
        installmentsLabel.anchor(bottom: containerView.safeBottomAnchor)
    }
}
