//
//  HomeItemView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
import SVGKit
import UIKit

enum HomeItemViewIdentifiers: String {
    case containerView = "homeItemView_containerView_id"
    case titleLabel = "homeItemView_titleLabel_id"
    case mainImageView = "homeItemView_mainImageView_id"
    case primaryButton = "homeItemView_primaryButton_id"
    case originalPriceLabel = "homeItemView_originalPriceLabel_id"
    case priceLabel = "homeItemView_priceLabel_id"
    case installmentsLabel = "homeItemView_installmentsLabel_id"
}

protocol HomeItemViewDelegate: AnyObject {
    func clickPrimaryButton(cell: HomeItemView)
}

final class HomeItemView: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let mainImageViewWidth: CGFloat = 108
        static let mainImageViewHeight: CGFloat = 120
        static let mainImageNameDefault: String = "icon_market"
        static let primaryButtonName: String = LocalizableBundle.homeItemViewPrimaryButtonName.localize
    }
    
    // MARK: - Properties
    
    private var viewModel: HomeItemViewModelProtocol?
    private weak var delegate: HomeItemViewDelegate?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutralWhite
        view.cornerRadius = .size(.extraSmall)
        view.accessibilityIdentifier = HomeItemViewIdentifiers.containerView.rawValue
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .regular, size: .medium)
        label.textColor = .neutralDarkGrey
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.accessibilityIdentifier = HomeItemViewIdentifiers.titleLabel.rawValue
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        let image = SVGKImage(named: Constants.mainImageNameDefault)
        imageView.image = image?.uiImage
        imageView.contentMode = .scaleAspectFill
        imageView.borderColor = .neutralDarkGrey
        imageView.borderWidth = 1
        imageView.cornerRadius = .size(.nano)
        imageView.accessibilityIdentifier = HomeItemViewIdentifiers.mainImageView.rawValue
        return imageView
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = .size(.extraSmall)
        button.backgroundColor = .neutralBlack
        button.setTitle(Constants.primaryButtonName, for: .normal)
        button.titleLabel?.font = UIFont(name: .bold, size: .small)
        button.accessibilityIdentifier = HomeItemViewIdentifiers.primaryButton.rawValue
        button.addTarget(self, action: #selector(clickPrimaryButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.font = UIFont(name: .light, size: .extraMinimum)
        label.textColor = .neutralDarkGrey
        label.accessibilityIdentifier = HomeItemViewIdentifiers.originalPriceLabel.rawValue
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.textColor = .neutralDarkGrey
        label.font = UIFont(name: .light, size: .minimum)
        label.accessibilityIdentifier = HomeItemViewIdentifiers.priceLabel.rawValue
        return label
    }()
    
    private lazy var installmentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.textColor = .neutralDarkGrey
        label.font = UIFont(name: .light, size: .small)
        label.accessibilityIdentifier = HomeItemViewIdentifiers.installmentsLabel.rawValue
        return label
    }()
    
    // MARK: - Instantiate
    
    static func instantiate(viewModel: HomeItemViewModelProtocol) -> HomeItemView {
        let view = HomeItemView()
        view.viewModel = viewModel
        view.bindElements()
        view.setupLayout()
        return view
    }
    
    // MARK: - Public Methods
    
    func setup(viewModel: HomeItemViewModelProtocol, delegate: HomeItemViewDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        bindElements()
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func bindElements() {
        viewModel?.model.bind { [weak self] model in
            guard let self = self else { return }
            self.titleLabel.text = model?.name
            setupImage(imageUrl: model?.image)
            self.installmentsLabel.text = model?.installments
            self.priceLabel.text = model?.actualPrice
            self.originalPriceLabel.text = model?.regularPrice
            self.originalPriceLabel.isHidden = model?.onSale == false
        }
    }
    
    private func setupImage(imageUrl: String?) {
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            self.mainImageView.downloaded(from: imageUrl)
            mainImageView.contentMode = .scaleAspectFill
            return
        }
        let image = SVGKImage(named: Constants.mainImageNameDefault)
        self.mainImageView.image = image?.uiImage
        self.mainImageView.contentMode = .scaleToFill
    }

    private func setupLayout() {
        contentView.isUserInteractionEnabled = true
        backgroundColor = .neutralLightGrey
        selectionStyle = .none
        setupContainerViewLayout()
        setupTitleLayout()
        setupMainImageViewLayout()
        setupPrimaryButtonLayout()
        setupInstallmentsLabelLayout()
        setupPriceLabelLayout()
        setupOrigialPriceLabelLayout()
    }
    
    private func setupContainerViewLayout() {
        addSubview(containerView)
        containerView.anchor(left: safeLeftAnchor,
                             right: safeRightAnchor,
                             paddingLeft: .spacing(.medium),
                             paddingRight: .spacing(.medium))
        containerView.anchor(top: safeTopAnchor,
                             bottom: safeBottomAnchor,
                             paddingBottom: .spacing(.extraSmall))
    }
    
    private func setupTitleLayout() {
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.safeTopAnchor,
                          paddingTop: .spacing(.small))
        titleLabel.anchor(left: containerView.safeLeftAnchor,
                          right: containerView.safeRightAnchor,
                          paddingLeft: .spacing(.small),
                          paddingRight: .spacing(.small))
    }
    
    private func setupMainImageViewLayout() {
        containerView.addSubview(mainImageView)
        mainImageView.anchor(top: titleLabel.safeBottomAnchor,
                             bottom: containerView.safeBottomAnchor,
                             paddingTop: .spacing(.extraSmall),
                             paddingBottom: .spacing(.small))
        mainImageView.anchor(width: Constants.mainImageViewWidth,
                             height: Constants.mainImageViewHeight)
        mainImageView.anchor(left: containerView.safeLeftAnchor,
                             paddingLeft: .spacing(.small))
    }
    
    private func setupPrimaryButtonLayout() {
        containerView.addSubview(primaryButton)
        primaryButton.anchor(bottom: mainImageView.safeBottomAnchor,
                             paddingBottom: .spacing(.zero))
        primaryButton.anchor(right: titleLabel.safeRightAnchor)
        primaryButton.anchor(width: 100, height: .size(.big))
    }
    
    private func setupInstallmentsLabelLayout() {
        containerView.addSubview(installmentsLabel)
        installmentsLabel.anchor(bottom: primaryButton.safeTopAnchor, paddingBottom: .spacing(.nano))
        installmentsLabel.anchor(left: primaryButton.safeLeftAnchor, right: titleLabel.safeRightAnchor)
    }
    
    private func setupPriceLabelLayout() {
        containerView.addSubview(priceLabel)
        priceLabel.anchor(bottom: installmentsLabel.safeTopAnchor, paddingBottom: .spacing(.nano))
        priceLabel.anchor(left: primaryButton.safeLeftAnchor, right: titleLabel.safeRightAnchor)
    }
    
    private func setupOrigialPriceLabelLayout() {
        containerView.addSubview(originalPriceLabel)
        originalPriceLabel.anchor(bottom: priceLabel.safeTopAnchor, paddingBottom: .spacing(.nano))
        originalPriceLabel.anchor(left: primaryButton.safeLeftAnchor, right: titleLabel.safeRightAnchor)
    }
    
    @objc
    private func clickPrimaryButton() {
        delegate?.clickPrimaryButton(cell: self)
    }
}
