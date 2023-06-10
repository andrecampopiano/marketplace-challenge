//
//  HomeItemView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 09/06/23.
//

import CoreSwift
import UIKit

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
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutralWhite
        view.cornerRadius = .size(.extraSmall)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .light, size: .medium)
        label.textColor = .neutralDarkGrey
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.borderColor = .neutralDarkGrey
        imageView.borderWidth = 1
        imageView.cornerRadius = .size(.nano)
        return imageView
    }()
    
    private lazy var containerSizeView: UIStackView = {
        let view = UIStackView()
        view.cornerRadius = .size(.nano)
        view.axis = .vertical
        view.backgroundColor = .neutralWhite
        view.borderColor = .neutralDarkGrey
        view.borderWidth = 1
        view.spacing = .spacing(.zero)
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = .size(.extraSmall)
        button.backgroundColor = .secondaryGreen
        button.setTitle(Constants.primaryButtonName, for: .normal)
        button.titleLabel?.font = UIFont(name: .bold, size: .small)
        return button
    }()
    
    private lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.font = UIFont(name: .light, size: .extraMinimum)
        label.textColor = .neutralDarkGrey
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.textColor = .neutralDarkGrey
        label.font = UIFont(name: .light, size: .minimum)
        return label
    }()
    
    private lazy var installmentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.textColor = .neutralDarkGrey
        label.font = UIFont(name: .light, size: .small)
        return label
    }()
    
    // MARK: - Initialize
    
    static func instantiate(viewModel: HomeItemViewModelProtocol) -> HomeItemView {
        let view = HomeItemView()
        view.viewModel = viewModel
        view.setup()
        return view
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        bindElements()
        setupLayout()
    }
    
    private func bindElements() {
        viewModel?.model.bind { [weak self] model in
            guard let self = self else { return }
            self.titleLabel.text = model?.name
            setupImage(imageUrl: model?.image)
            self.installmentsLabel.text = model?.installments
            self.priceLabel.text = model?.actualPrice
            self.originalPriceLabel.text = model?.regularPrice
            self.originalPriceLabel.isHidden = model?.onSale == false
            self.setupSizes(model: model?.sizes)
        }
    }
    
    private func setupImage(imageUrl: String?) {
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            self.mainImageView.downloaded(from: imageUrl)
            mainImageView.contentMode = .scaleAspectFill
            return
        }
        self.mainImageView.image = UIImage(named: Constants.mainImageNameDefault)
        mainImageView.contentMode = .scaleToFill
    }

    private func setupSizes(model: [ProductSizeResponse]?) {
        guard let model = model else { return }
        let label = UILabel()
        label.font = UIFont(name: .bold, size: .extraMinimum)
        label.textColor = .neutralWhite
        label.backgroundColor = .neutralDarkGrey
        label.text = "Tam"
        label.textAlignment = .center
        containerSizeView.addArrangedSubview(label)
        for item in model {
            let label = UILabel()
            label.text = item.size
            label.textAlignment = .center
            label.borderColor = .neutralDarkGrey
            label.borderWidth = 0.5
            label.textColor = .neutralDarkGrey
            label.font = UIFont(name: .light, size: .extraMinimum)
            containerSizeView.addArrangedSubview(label)
        }
    }
    
    private func setupLayout() {
        backgroundColor = .neutralLightGrey
        setupContainerViewLayout()
        setupTitleLayout()
        setupMainImageViewLayout()
        setupContainerSizeViewLayout()
        setupPrimaryButtonLayout()
        setupInstallmentsLabelLayout()
        setupPriceLabelLayout()
        setupOrigialPriceLabelLayout()
    }
    
    private func setupContainerViewLayout() {
        addSubview(containerView)
        containerView.anchor(left: safeLeftAnchor,
                             right: safeRightAnchor,
                             paddingLeft: .spacing(.smaller),
                             paddingRight: .spacing(.smaller))
        containerView.anchor(top: safeTopAnchor,
                             bottom: safeBottomAnchor,
                             paddingTop: .spacing(.smaller),
                             paddingBottom: .spacing(.smaller))
    }
    
    private func setupTitleLayout() {
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.safeTopAnchor,
                          paddingTop: .spacing(.small))
        titleLabel.anchor(left: containerView.safeLeftAnchor,
                          right: containerView.safeRightAnchor,
                          paddingLeft: .spacing(.extraSmall),
                          paddingRight: .spacing(.extraSmall))
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
                             paddingLeft: .spacing(.extraSmall))
    }
    
    private func setupContainerSizeViewLayout() {
        containerView.addSubview(containerSizeView)
        containerSizeView.anchor(top: mainImageView.safeTopAnchor,
                                 bottom: mainImageView.safeBottomAnchor)
        containerSizeView.anchor(left: mainImageView.safeRightAnchor, paddingLeft: .spacing(.extraSmall))
        containerSizeView.anchor(width: .size(.medium))
    }
    
    private func setupPrimaryButtonLayout() {
        containerView.addSubview(primaryButton)
        primaryButton.anchor(bottom: mainImageView.safeBottomAnchor,
                             paddingBottom: .spacing(.zero))
        primaryButton.anchor(left: containerSizeView.safeRightAnchor,
                             right: titleLabel.safeRightAnchor,
                             paddingLeft: .spacing(.small))
        primaryButton.anchor(height: .size(.big))
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
}
