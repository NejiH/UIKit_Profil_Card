//
//  MyModalViewController.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 07/08/2025.
//

import UIKit

class MyModalViewController: UIViewController {
    
    let viewModel = ModalViewModel()
    
    let gradientView = UIView()
    let closeModalButton = UIButton()
    let modalView = UIView()
    let nameLabel = UILabel()
    let locationName = UILabel()
    let jobLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let skillLabel = UILabel()
    let containerTopView = UIView()
    let hStackTopView = UIStackView()
    let containerBottomView = UIView()
    let aboutLabel = UILabel()
    let aboutDesc = UILabel()
    let projectLabel = UILabel()
    let projectDesc = UILabel()
    let hStackBottomView = UIStackView()
    let buttonLinkedIn = UIButton()
    let buttonMail = UIButton()
    
    lazy var mainStackView: UIStackView = {
           // Mettez ici toutes les vues qui s'empilent verticalement
           let stack = UIStackView(arrangedSubviews: [
               nameLabel,
               containerTopView,
               skillLabel,
               collectionView,
               containerBottomView,
               hStackBottomView
           ])
           stack.axis = .vertical
           stack.spacing = 16 // Un espacement par défaut, vous pouvez le personnaliser
           stack.alignment = .fill
           return stack
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
