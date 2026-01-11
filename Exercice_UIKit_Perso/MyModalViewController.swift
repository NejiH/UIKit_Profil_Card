//
//  MyModalViewController.swift
//  Exercice_UIKit_Perso
//

import UIKit

class MyModalViewController: UIViewController {
    
    let viewModel = ModalViewModel()
    
    //MARK: - Déclarations
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
           // vues qui s'empilent verticalement
           let stack = UIStackView(arrangedSubviews: [
               nameLabel,
               containerTopView,
               skillLabel,
               collectionView,
               containerBottomView,
               hStackBottomView
           ])
           stack.axis = .vertical
           stack.spacing = 16
           stack.alignment = .fill
           return stack
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
