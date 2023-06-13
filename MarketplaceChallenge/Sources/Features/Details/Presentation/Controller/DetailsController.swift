//
//  DetailsController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import CoreSwift
import SVGKit
import UIKit

final class DetailsController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let primaryButtonName: String = LocalizableBundle.homeItemViewPrimaryButtonName.localize
        static let containerFooterViewHeight: CGFloat = 230
        static let mainImageNameDefault: String = "icon_market"
    }
    
    // MARK: - Properties
    
    private var viewModel: DetailsControllerViewModelProtocol?
    
    private lazy var containerImageView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        let image = SVGKImage(named: Constants.mainImageNameDefault)
        imageView.image = image?.uiImage
        imageView.image = UIImage(named: "icon_market")
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .neutralWhite
        imageView.accessibilityIdentifier = HomeItemViewIdentifiers.mainImageView.rawValue
        return imageView
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
        let footerView = ButtonBuyFooterView.instantiate()
        return footerView
    }()
    
    // MARK: - Instantiate
    
    static func instantiate(viewModel: DetailsControllerViewModelProtocol) -> DetailsController {
        let controller = DetailsController()
        controller.viewModel = viewModel
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
        setupContainerFooterViewLayout()
        setupFooterViewLayout()
        setupProductDetailsViewLayout()
        setupSizeViewLayout()
        setupMainImageViewLayout()
    }
    
    private func setupContainerFooterViewLayout() {
        view.addSubview(containerFooterView)
        containerFooterView.anchor(left: view.safeLeftAnchor, right: view.safeRightAnchor)
        containerFooterView.anchor(bottom: view.bottomAnchor)
        containerFooterView.anchor(height: Constants.containerFooterViewHeight)
    }
    
    private func setupMainImageViewLayout() {
        view.addSubview(mainImageView)
        mainImageView.anchor(top: view.safeTopAnchor,
                             bottom: sizeView.safeTopAnchor,
                             paddingTop: .spacing(.medium),
                             paddingBottom: .spacing(.medium))
        mainImageView.anchor(left: view.safeLeftAnchor,
                             right: view.safeRightAnchor,
                             paddingLeft: .spacing(.medium),
                             paddingRight: .spacing(.medium))
    }
    
    private func setupSizeViewLayout() {
        view.addSubview(sizeView)
        sizeView.anchor(bottom: productDetailsView.safeTopAnchor,
                        paddingBottom: .size(.small))
        sizeView.anchor(horizontal: view.centerXAnchor)
//        sizeView.anchor(left: view.safeLeftAnchor,
//                        right: view.safeRightAnchor,
//                        paddingLeft: .spacing(.medium),
//                        paddingRight: .spacing(.medium))
        sizeView.anchor(height: .spacing(.large))
        guard let count = viewModel?.model.value?.sizes?.count else { return }
        sizeView.anchorWidth(greaterThanOrEqualToConstant: .spacing(.large) * CGFloat(count), horizontalParent: view, maxPadding: .spacing(.medium))
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
}
