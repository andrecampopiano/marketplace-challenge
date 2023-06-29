//
//  CartItemView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 26/06/23.
//

import UIKit

protocol CartItemViewDelegate: AnyObject {
    func clickRemoveItem(item: UITableViewCell)
}

final class CartItemView: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let trashIconName: String = "icon_trash"
    }
    
    // MARK: - Properties
    
    private weak var delegate: CartItemViewDelegate?
    private var viewModel: CartItemViewModelProtocol?
    
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
        imageView.clipsToBounds = true
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
    
    private lazy var sizeView: SizeComponentView = {
        let view = SizeComponentView()
        view.sizeItem = .spacing(.big)
        return view
    }()
    
    // MARK: - Instantiate
    
    static func instantiate() -> CartItemView {
        let view = CartItemView()
        return view
    }
    
    // MARK: - Public Methods
    
    func setup(viewModel: CartItemViewModelProtocol?, delegate: CartItemViewDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        setupDataSource()
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupDataSource() {
        bindElements()
    }
    
    private func bindElements() {
        viewModel?.imageUrl.bind { [weak self] image in
            guard let self = self else { return }
            self.mainImageView.downloaded(from: image ?? String())
        }
        
        viewModel?.title.bind { [weak self] title in
            guard let self = self else { return }
            self.titleLabel.text = title
        }
        
        viewModel?.amount.bind { [weak self] amount in
            guard let self = self else { return }
            self.amountLabel.text = amount
        }
        
        viewModel?.price.bind { [weak self] price in
            guard let self = self else { return }
            self.itemPriceLabel.text = price
        }
        
        viewModel?.size.bind { [weak self] size in
            guard let self = self else { return }
            self.sizeView.setup(viewModel: SizeComponentViewModel(model: [SizeComponentModel(size: size)]))
        }
    }
    
    private func setupLayout() {
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        backgroundColor = .neutralLightGrey
        setupContainerViewLayout()
        setupMainImageViewLayout()
        setupTitleLabelLayout()
        setupAmountLabelLayout()
        setupItemPriceLabelLayout()
        setupSizeViewLayout()
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
        mainImageView.anchor(width: 100, height: 100 * 1.26)
    }
    
    private func setupTitleLabelLayout() {
        containerView.addSubview(titleLabel)
        titleLabel.anchor(top: containerView.safeTopAnchor,
                          paddingTop: .spacing(.extraSmall))
        titleLabel.anchor(left: mainImageView.safeRightAnchor,
                          paddingLeft: .spacing(.small))
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
        trashButton.anchor(width: .size(.small), height: .size(.small))
        trashButton.anchor(left: titleLabel.safeRightAnchor,
                           right: containerView.safeRightAnchor,
                           paddingLeft: .spacing(.small),
                           paddingRight: .spacing(.small))
        trashButton.anchor(top: containerView.safeTopAnchor,
                           paddingTop: .spacing(.extraSmall))
    }
    
    private func setupSizeViewLayout() {
        containerView.addSubview(sizeView)
        sizeView.anchor(bottom: itemPriceLabel.safeTopAnchor,
                        paddingBottom: .size(.nano))
        sizeView.anchor(right: amountLabel.safeRightAnchor)
        sizeView.anchor(width: .spacing(.big), height: .spacing(.big))
    }
    
    @objc
    private func clickRemoveItem() {
        delegate?.clickRemoveItem(item: self)
    }
}
