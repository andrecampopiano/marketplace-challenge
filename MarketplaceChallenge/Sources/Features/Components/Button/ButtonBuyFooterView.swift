//
//  ButtonBuyFooterView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import UIKit

enum ButtonBuyFooterViewIdentifiers: String {
    case containerView = "buttonBuyFooterView_containerView_id"
    case primaryButton = "buttonBuyFooterView_primaryButton_id"
    case secoundaryButton = "buttonBuyFooterView_secoundaryButton_id"
}

protocol ButtonBuyFooterViewDelegate: AnyObject {
    func clickPrimaryButton()
    func clickSecondaryButton()
}

final class ButtonBuyFooterView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let primaryButtonName: String = LocalizableBundle.buttonBuyFooterViewPrimaryButtonName.localize
        static let secoundaryButtonName: String = LocalizableBundle.buttonBuyFooterViewSecoundaryButtonName.localize
    }
    
    // MARK: - Properties
    
    weak var delegate: ButtonBuyFooterViewDelegate?
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = .spacing(.extraSmall)
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.accessibilityIdentifier = ButtonBuyFooterViewIdentifiers.containerView.rawValue
        return stackView
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = .spacing(.small)
        button.backgroundColor = .neutralBlack
        button.setTitle(Constants.primaryButtonName, for: .normal)
        button.titleLabel?.font = UIFont(name: .medium, size: .minimum)
        button.addTarget(self, action: #selector(clickPrimaryButton), for: .touchUpInside)
        button.accessibilityIdentifier = ButtonBuyFooterViewIdentifiers.primaryButton.rawValue
        return button
    }()
    
    private lazy var secondaryButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = .spacing(.small)
        button.backgroundColor = .neutralWhite
        button.titleLabel?.textColor = .neutralBlack
        button.setTitleColor(.neutralBlack, for: .normal)
        button.borderColor = .neutralBlack
        button.borderWidth = 1
        button.setTitle(Constants.secoundaryButtonName, for: .normal)
        button.titleLabel?.font = UIFont(name: .medium, size: .minimum)
        button.addTarget(self, action: #selector(clickSecondaryButton), for: .touchUpInside)
        button.accessibilityIdentifier = ButtonBuyFooterViewIdentifiers.secoundaryButton.rawValue
        return button
    }()
    
    // MARK: - Instantiate
    
    static func instantiate(frame: CGRect = .zero) -> ButtonBuyFooterView {
        let view = ButtonBuyFooterView(frame: frame)
        view.setup()
        return view
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .neutralLightGrey
        setupContainerViewLayout()
        setupPrimaryButtonLayout()
        setupSecondaryButtonLayout()
    }
    
    private func setupContainerViewLayout() {
        addSubview(containerView)
        containerView.anchor(top: topAnchor,
                             bottom: bottomAnchor,
                             paddingTop: .spacing(.extraSmall),
                             paddingBottom: .spacing(.extraSmall))
        containerView.anchor(left: leftAnchor,
                             right: rightAnchor,
                             paddingLeft: .spacing(.extraSmall),
                             paddingRight: .spacing(.extraSmall))
    }
    
    private func setupPrimaryButtonLayout() {
        containerView.addArrangedSubview(primaryButton)
    }
    
    private func setupSecondaryButtonLayout() {
        containerView.addArrangedSubview(secondaryButton)
    }
    
    @objc
    private func clickPrimaryButton() {
        delegate?.clickPrimaryButton()
    }
    
    @objc
    private func clickSecondaryButton() {
        delegate?.clickSecondaryButton()
    }
}
