//
//  UIView.swift
//  MarketplaceChallenge
//
//  Created by Andre Luis Campopiano on 12/06/23.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {
            let cornerRadii = CGSize(width: radius, height: radius)
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    func anchorFillSuperView(padding: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.safeTopAnchor, constant: padding).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeBottomAnchor, constant: padding).isActive = true
        leftAnchor.constraint(equalTo: superview.safeLeftAnchor, constant: padding).isActive = true
        rightAnchor.constraint(equalTo: superview.safeRightAnchor, constant: padding).isActive = true
    }
    
    func anchorWidth(greaterThanOrEqualToConstant size: CGFloat, horizontalParent: UIView, maxPadding: CGFloat) {
        let constrant = widthAnchor.constraint(equalToConstant: size)
        constrant.isActive = true
        constrant.priority = .defaultHigh
        let rightConstrant = rightAnchor.constraint(equalTo: horizontalParent.safeRightAnchor, constant: -maxPadding)
        rightConstrant.isActive = true
        rightConstrant.priority = .defaultLow
        let leftConstrant = leftAnchor.constraint(equalTo: horizontalParent.safeLeftAnchor, constant: maxPadding)
        leftConstrant.isActive = true
        leftConstrant.priority = .defaultLow
    }
}
