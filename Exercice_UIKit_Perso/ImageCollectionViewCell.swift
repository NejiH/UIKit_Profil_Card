//
//  ImageCollectionViewCell.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 24/07/2025.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 2, height:5)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 3
        return imageView
    }()
    
    //MARK: - Initialisateur d'une cellule
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
    }
    
    //MARK: - Erreur à gérer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
