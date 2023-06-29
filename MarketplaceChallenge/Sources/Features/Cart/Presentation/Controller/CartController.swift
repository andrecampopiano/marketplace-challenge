//
//  CartController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 14/06/23.
//

import UIKit

typealias ShowCartFlowWithNewItem = (_ item: CartModel?) -> Void
typealias ShowCartFlow = () -> Void

final class CartController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let primaryButtonName: String = LocalizableBundle.cartControllerPrimaryButtonName.localize
        static let trashButtonIconName: String = "icon_trash"
    }
    
    // MARK: - Properties
    
    var viewModel: CartViewModelProtocol?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableBundle.cartControllerTitle.localize
        label.font = UIFont(name: .condensedBlack, size: .big)
        label.textAlignment = .center
        label.textColor = .neutralDarkGrey
        return label
    }()
    
    private lazy var clearCartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.trashButtonIconName), for: .normal)
        button.addTarget(self, action: #selector(clickClearCart), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.registerCell(CartItemView.self)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.backgroundColor = .neutralLightGrey
        return tableView
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .neutralBlack
        view.cornerRadius = .size(.extraSmall)
        return view
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: .condensedBlack, size: .big)
        label.textColor = .neutralWhite
        label.textAlignment = .right
        return label
    }()
    
    private lazy var buttonsFooterView: ButtonBuyFooterView = {
        let view = ButtonBuyFooterView.instantiate(primaryButtonName: Constants.primaryButtonName,
                                                   secoundaryButtonName: nil)
        
        return view
    }()
    
    // MARK: - Instantiate
    
    static func instantiate() -> CartController {
        let controller = CartController()
        return controller
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        setupDataSource()
        setupLayout()
    }
    
    private func setupDataSource() {
        bindElements()
    }
    
    private func bindElements() {
        viewModel?.status.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        viewModel?.amountValue.bind {[weak self] amount in
            guard let self = self else { return }
            self.amountLabel.text = amount
        }
    }
    
    private func setupLayout() {
        view.backgroundColor = .neutralWhite
        setupTitleLabelLayout()
        setupClearCartButtonLayout()
        setupButtonsFooterViewLayout()
        setupFooterViewLayout()
        setupAmountLabelLayout()
        setupTableViewLayout()
    }
    
    private func setupTitleLabelLayout() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeTopAnchor, paddingTop: .spacing(.medium))
        titleLabel.anchor(left: view.safeLeftAnchor, right: view.safeRightAnchor, paddingLeft: .spacing(.small), paddingRight: .spacing(.small))
    }
    
    private func setupClearCartButtonLayout() {
        view.addSubview(clearCartButton)
        clearCartButton.anchor(vertical: titleLabel.safeCenterYAnchor)
        clearCartButton.anchor(right: view.safeRightAnchor, paddingRight: .spacing(.smaller))
        clearCartButton.anchor(width: .size(.small), height: .size(.small))
    }
    
    private func setupButtonsFooterViewLayout() {
        view.addSubview(buttonsFooterView)
        buttonsFooterView.anchor(bottom: view.safeBottomAnchor)
        buttonsFooterView.anchor(left: view.safeLeftAnchor,
                                 right: view.safeRightAnchor)
        buttonsFooterView.anchor(height: .size(.xLarge))
    }
    
    private func setupFooterViewLayout() {
        view.addSubview(footerView)
        footerView.anchor(left: buttonsFooterView.safeLeftAnchor,
                          right: buttonsFooterView.safeRightAnchor,
                          paddingLeft: .spacing(.smaller),
                          paddingRight: .spacing(.smaller))
        footerView.anchor(bottom: buttonsFooterView.safeTopAnchor,
                          paddingBottom: .spacing(.small))
        footerView.anchor(height: .size(.large))
    }
    
    private func setupAmountLabelLayout() {
        footerView.addSubview(amountLabel)
        amountLabel.anchor(vertical: footerView.safeCenterYAnchor)
        amountLabel.anchor(right: footerView.safeRightAnchor,
                           paddingRight: .spacing(.smaller))
    }
    
    private func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.anchor(top: titleLabel.safeBottomAnchor,
                         bottom: footerView.safeTopAnchor,
                         paddingTop: .spacing(.smaller),
                         paddingBottom: .spacing(.small))
        tableView.anchor(left: view.safeLeftAnchor,
                         right: view.safeRightAnchor)
    }
    
    @objc
    private func clickClearCart() {
        viewModel?.clearCart()
    }
}

extension CartController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.cartItemsViewModel.value?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(CartItemView.self, for: indexPath)
        cell.setup(viewModel: viewModel?.cartItemsViewModel.value?[indexPath.row], delegate: self)
        return cell
    }
}

extension CartController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CartController: CartItemViewDelegate {
    func clickRemoveItem(item: UITableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: item) else { return }
        viewModel?.removeItem(position: indexPath.row)
    }
}
