//
//  HomeController.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 05/06/23.
//

import CoreSwift
import UIKit

class HomeController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let navigationTitle: String = LocalizableBundle.homeControllerNavigationTitle.localize
    }
    
    // MARK: - Properties

    private var viewModel: HomeViewModelProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.registerCell(HomeItemView.self)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .neutralLightGrey
        return tableView
    }()
    
    // MARK: - Instantiate
    
    static func instantiate(viewModel: HomeViewModelProtocol) -> HomeController {
        let viewController = HomeController()
        viewController.viewModel = viewModel
        return viewController
    }
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindElements()
        viewModel?.fetchProductList()
        setupLayout()
    }

    // MARK: - Private Methods
    
    private func bindElements() {
        viewModel?.status.bind { [weak self] status in
            guard let self = self else { return }
            switch status {
            case .loaded:
                self.reloadData()
            default:
                break
            }
        }
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupLayout() {
        view.backgroundColor = .neutralLightGrey
        title = Constants.navigationTitle
        setupTableViewLayout()
    }
    
    private func setupTableViewLayout() {
        view.addSubview(tableView)
        tableView.anchor(left: view.safeLeftAnchor,
                         right: view.safeRightAnchor)
        tableView.anchor(top: view.safeTopAnchor, bottom: view.safeBottomAnchor)
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.status.value == .loaded ? self.viewModel?.model.value?.products?.count ?? .zero : .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.model.value?.products?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(HomeItemView.self, for: indexPath)
        cell.setup(viewModel: HomeItemViewModel(model: item))
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
