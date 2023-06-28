//
//  CartController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 14/06/23.
//

import UIKit

typealias ShowCartFlow = () -> Void

final class CartController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let primaryButtonName: String = LocalizableBundle.cartControllerPrimaryButtonName.localize
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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.registerCell(CartItemView.self)
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.backgroundColor = .neutralLightGrey
        return tableView
    }()
    
    private lazy var footerView: ButtonBuyFooterView = {
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
    
    private func bindElements() { }
    
    private func setupLayout() {
        view.backgroundColor = .neutralWhite
        setupTitleLabelLayout()
        setupFooterViewLayout()
        setupTableViewLayout()
    }
    
    private func setupTitleLabelLayout() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeTopAnchor, paddingTop: .spacing(.medium))
        titleLabel.anchor(left: view.safeLeftAnchor, right: view.safeRightAnchor, paddingLeft: .spacing(.small), paddingRight: .spacing(.small))
    }
    
    private func setupFooterViewLayout() {
        view.addSubview(footerView)
        footerView.anchor(bottom: view.safeBottomAnchor)
        footerView.anchor(left: view.safeLeftAnchor,
                          right: view.safeRightAnchor)
        footerView.anchor(height: .size(.xLarge))
    }
    
    private func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.anchor(top: titleLabel.safeBottomAnchor,
                         bottom: footerView.safeTopAnchor,
                         paddingTop: .spacing(.smaller),
                         paddingBottom: .spacing(.zero))
        tableView.anchor(left: view.safeLeftAnchor,
                         right: view.safeRightAnchor)
    }
}

extension CartController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(CartItemView.self, for: indexPath)
        cell.setup()
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
