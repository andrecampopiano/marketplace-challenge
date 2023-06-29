//
//  SizeComponentView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 13/06/23.
//

import CoreSwift
import UIKit

final class SizeComponentView: UIView {
    
    // MARK: - Properties
    var sizeItem: CGFloat = .size(.large)
    
    private var viewModel: SizeComponentViewModelProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(SizeComponentItemView.self)
        collectionView.cornerRadius = .size(.extraSmall)
        collectionView.borderColor = .neutralBlack
        collectionView.borderWidth = 0.5
        return collectionView
    }()
    
    // MARK: - Instantiate
    
    static func instantiate(frame: CGRect = .zero) -> SizeComponentView {
        let view = SizeComponentView(frame: frame)
        return view
    }
    
    // MARK: - Public Methods
    
    func setup(viewModel: SizeComponentViewModelProtocol?) {
        self.viewModel = viewModel
        setupDataSource()
        setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupDataSource() {
        bindElements()
    }
    
    private func setupLayout() {
        setupCollectionViewLayout()
    }
    
    private func bindElements() {
        viewModel?.model.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.collectionView.selectItem(at: IndexPath(row: .zero, section: .zero),
                                               animated: false,
                                               scrollPosition: .top)
            }
        }
    }
    
    private func setupCollectionViewLayout() {
        addSubview(collectionView)
        collectionView.anchorFillSuperView()
    }
}

extension SizeComponentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.model.value?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(SizeComponentItemView.self, for: indexPath)
        let itemModel = viewModel?.model.value?[indexPath.row]
        cell.setup(title: itemModel?.size)
        return cell
    }
}

extension SizeComponentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.updateSelectedItem(position: indexPath.row)
    }
}

extension SizeComponentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: sizeItem, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
