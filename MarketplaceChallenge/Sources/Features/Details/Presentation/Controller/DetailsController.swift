//
//  DetailsController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import SVGKit
import UIKit

typealias ShowDetailsFlow = (_ model: ProductModel?) -> Void

final class DetailsController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let primaryButtonName: String = LocalizableBundle.buttonBuyFooterViewPrimaryButtonName.localize
        static let secoundaryButtonName: String = LocalizableBundle.buttonBuyFooterViewSecoundaryButtonName.localize
        static let sizeTitle: String = LocalizableBundle.detailsControllerSizeTitle.localize
        static let mainImageNameDefault: String = "icon_market"
        static let cartButtonIconName: String = "icon_cart"
    }
    
    // MARK: - Properties
    
    var viewModel: DetailsControllerViewModelProtocol?
    var showCartFlowWithNewItem: ShowCartFlowWithNewItem?
    var addItemToCart: AddItemToCart?
    var showCartFlow: ShowCartFlow?
    
    private var collectionViewWidth: CGFloat {
        CGFloat(self.viewModel?.model.value?.sizes?.count ?? 1) * .spacing(.large)
    }
    
    private lazy var containerImageView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        let image = SVGKImage(named: Constants.mainImageNameDefault)
        imageView.image = image?.uiImage
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .neutralWhite
        imageView.accessibilityIdentifier = HomeItemViewIdentifiers.mainImageView.rawValue
        return imageView
    }()
    
    private lazy var sizeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .bold, size: .medium)
        label.textColor = .neutralBlack
        label.text = Constants.sizeTitle
        label.textAlignment = .center
        return label
    }()
    
    private lazy var sizeView: SizeComponentView = {
        let view = SizeComponentView()
        
        return view
    }()
    
    private lazy var containerFooterView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutralLightGrey
        view.clipsToBounds = true
        view.roundCorners(corners: [.topLeft, .topRight], radius: .size(.medium))
        return view
    }()
    
    private lazy var productDetailsView: ProductDetailsView = {
        let view = ProductDetailsView()
        return view
    }()
    
    private lazy var footerView: ButtonBuyFooterView = {
        let footerView = ButtonBuyFooterView.instantiate(primaryButtonName: Constants.primaryButtonName,
                                                         secoundaryButtonName: Constants.secoundaryButtonName)
        footerView.delegate = self
        return footerView
    }()
    
    // MARK: - Instantiate
    
    static func instantiate() -> DetailsController {
        let controller = DetailsController()
        return controller
    }
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupData()
        setupLayout()
    }
    
    private func setupData() {
        bindElements()
        sizeView.setup(viewModel: viewModel?.sizeViewModel)
        productDetailsView.setup(viewModel: viewModel?.productDetailsViewModel)
    }
    
    private func bindElements() {
        viewModel?.model.bind { [weak self] model in
            guard let self = self else { return }
            if let imageUrl = model?.image {
                self.bindImageView(imageUrl: imageUrl)
            }
        }
    }
    
    private func bindImageView(imageUrl: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mainImageView.downloaded(from: imageUrl)
            self.mainImageView.contentMode = .scaleAspectFill
        }
    }
    
    private func setupLayout() {
        view.backgroundColor = .neutralWhite
        setupCartButtonLayout()
        setupContainerFooterViewLayout()
        setupFooterViewLayout()
        setupProductDetailsViewLayout()
        setupSizeViewLayout()
        setupSizeTitleLabelLayout()
        setupMainImageViewLayout()
    }
    
    private func setupCartButtonLayout() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Constants.cartButtonIconName),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(cartButtonTapped))
    }
    
    private func setupContainerFooterViewLayout() {
        view.addSubview(containerFooterView)
        containerFooterView.anchor(left: view.safeLeftAnchor, right: view.safeRightAnchor)
        containerFooterView.anchor(bottom: view.bottomAnchor)
    }
    
    private func setupMainImageViewLayout() {
        view.addSubview(mainImageView)
        mainImageView.anchor(top: view.safeTopAnchor,
                             bottom: sizeTitleLabel.safeTopAnchor,
                             paddingBottom: .spacing(.extraSmall))
        mainImageView.anchor(left: view.safeLeftAnchor,
                             right: view.safeRightAnchor,
                             paddingLeft: .spacing(.medium),
                             paddingRight: .spacing(.medium))
    }
    
    private func setupSizeTitleLabelLayout() {
        view.addSubview(sizeTitleLabel)
        sizeTitleLabel.anchor(bottom: sizeView.safeTopAnchor,
                              paddingBottom: .spacing(.nano))
        sizeTitleLabel.anchor(height: .size(.medium))
        sizeTitleLabel.anchor(horizontal: view.centerXAnchor)
    }
    
    private func setupSizeViewLayout() {
        view.addSubview(sizeView)
        sizeView.anchor(bottom: productDetailsView.safeTopAnchor,
                        paddingBottom: .size(.small))
        sizeView.anchor(horizontal: view.centerXAnchor)
        sizeView.anchor(height: .spacing(.large))
        sizeView.anchorWidth(greaterThanOrEqualToConstant: collectionViewWidth, horizontalParent: view, maxPadding: .spacing(.medium))
    }
    
    private func setupProductDetailsViewLayout() {
        containerFooterView.addSubview(productDetailsView)
        productDetailsView.anchor(top: containerFooterView.safeTopAnchor, bottom: footerView.safeTopAnchor)
        productDetailsView.anchor(left: containerFooterView.safeLeftAnchor, right: containerFooterView.safeRightAnchor)
    }
    
    private func setupFooterViewLayout() {
        containerFooterView.addSubview(footerView)
        footerView.anchor(bottom: containerFooterView.safeBottomAnchor)
        footerView.anchor(left: containerFooterView.safeLeftAnchor,
                          right: containerFooterView.safeRightAnchor)
        footerView.anchor(height: .size(.xLarge))
    }
    
    @objc
    private func cartButtonTapped() {
        showCartFlow?()
    }
}

extension DetailsController: ButtonBuyFooterViewDelegate {
    func clickPrimaryButton() {
        let cartModel = viewModel?.addToCart()
        addItemToCart?(cartModel)
    }
    
    func clickSecondaryButton() {
        let cartModel = viewModel?.addToCart()
        showCartFlowWithNewItem?(cartModel)
    }
}
