//
//  CartItemView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 26/06/23.
//

import UIKit

final class CartItemView: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let trashIconName: String = "icon_trash"
    }
    
    // MARK: - Properties
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.borderColor = .neutralDarkGrey
        view.borderWidth = 1
        view.cornerRadius = .size(.small)
        view.backgroundColor = .neutralWhite
        return view
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image_example")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .condensedBold, size: .medium)
        label.textColor = .neutralBlack
        label.text = "CALÇA COMFORT TASSEL"
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .regular, size: .small)
        label.text = "Valor: R$ 300,00"
        label.textAlignment = .right
        return label
    }()
    
    private lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .regular, size: .minimum)
        label.text = "Valor por Unidade: R$ 100,00"
        label.textAlignment = .right
        return label
    }()
    
    private lazy var trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.trashIconName), for: .normal)
        button.addTarget(self, action: #selector(clickRemoveItem), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Instantiate
    
    static func instantiate() -> CartItemView {
        let view = CartItemView()
        return view
    }
    
    // MARK: - Public Methods
    
    func setup() {
        setupDataSource()
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupDataSource() {
        bindElements()
    }
    
    private func bindElements() { }
    
    private func setupLayout() {
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        backgroundColor = .neutralLightGrey
        setupContainerViewLayout()
        setupMainImageViewLayout()
        setupTitleLabelLayout()
        setupAmountLabelLayout()
        setupItemPriceLabelLayout()
        setupTrashButtonLayout()
    }
    
    private func setupContainerViewLayout() {
        addSubview(containerView)
        containerView.anchor(left: safeLeftAnchor,
                             right: safeRightAnchor,
                             paddingLeft: .spacing(.medium),
                             paddingRight: .spacing(.medium))
        containerView.anchor(top: safeTopAnchor,
                             bottom: safeBottomAnchor,
                             paddingTop: .spacing(.nano),
                             paddingBottom: .spacing(.nano))
    }
    
    private func setupMainImageViewLayout() {
        containerView.addSubview(mainImageView)
        mainImageView.anchor(top: containerView.safeTopAnchor,
                             bottom: containerView.safeBottomAnchor,
                             paddingTop: .spacing(.zero),
                             paddingBottom: .spacing(.zero))
        mainImageView.anchor(left: containerView.safeLeftAnchor,
                             paddingLeft: .spacing(.small))
        mainImageView.anchor(width: .size(.xLarge),
                             height: 100)
    }
    
    private func setupTitleLabelLayout() {
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.safeTopAnchor,
                          paddingTop: .spacing(.extraSmall))
        titleLabel.anchor(left: mainImageView.safeRightAnchor,
                          right: containerView.safeRightAnchor,
                          paddingLeft: .spacing(.small),
                          paddingRight: .spacing(.small))
    }
    
    private func setupAmountLabelLayout() {
        containerView.addSubview(amountLabel)
        amountLabel.anchor(bottom: containerView.safeBottomAnchor,
                           paddingBottom: .spacing(.extraSmall))
        amountLabel.anchor(left: mainImageView.safeRightAnchor,
                           right: containerView.safeRightAnchor,
                           paddingLeft: .spacing(.nano),
                           paddingRight: .spacing(.small))
    }
    
    private func setupItemPriceLabelLayout() {
        containerView.addSubview(itemPriceLabel)
        itemPriceLabel.anchor(left: amountLabel.safeLeftAnchor,
                              right: amountLabel.safeRightAnchor)
        itemPriceLabel.anchor(bottom: amountLabel.safeTopAnchor,
                              paddingBottom: .spacing(.nano))
    }
    
    private func setupTrashButtonLayout() {
        containerView.addSubview(trashButton)
        trashButton.anchor(width: .size(.big), height: .size(.big))
        trashButton.anchor(right: containerView.safeRightAnchor,
                           paddingRight: .spacing(.extraSmall))
        trashButton.anchor(top: containerView.safeTopAnchor,
                           paddingTop: .spacing(.extraSmall))
    }
    
    @objc
    private func clickRemoveItem() {
        print("clickRemoveItem")
    }
}
