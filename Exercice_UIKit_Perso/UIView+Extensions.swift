//
//  UIView+Extensions.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 07/08/2025.
//

import Foundation
import UIKit

extension UIView {
    func pinToEdges(of superview: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: padding),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding)
        ])
    }
    
    /// Centre la vue dans sa vue parente.
    func center(in superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
    
    func widtHeightAnchor(padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: padding),
        heightAnchor.constraint(equalToConstant: padding)
        ])
    }
}
