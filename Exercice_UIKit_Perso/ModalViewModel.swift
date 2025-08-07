//
//  ModalViewModel.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 25/07/2025.
//

import Foundation
import UIKit

class ModalViewModel {
    
    func titleLabelViewModel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }

    func descLabelViewModel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }
    
    func locationLabelViewModel(city: String) -> UILabel {
        let label = UILabel()
        label.text = city
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    func containerViewModel() -> UIView {
        let container = UIView()
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }
    
    func HStackViewModel() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
}


