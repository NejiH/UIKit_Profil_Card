//
//  ViewController.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 22/07/2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Componants
    private let profilPicture: UIImageView = {
        let profilPicture = UIImageView()
        profilPicture.image = UIImage(named: "arnaud")
        profilPicture.contentMode = .scaleAspectFill
        
        return profilPicture
    }()
    
    private func strokeWhite() {
        let stroke: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.white,
            .foregroundColor : UIColor.black,
            .strokeWidth : -2.0,
        ]
        
        let _ = NSAttributedString(string: showModalButton.title(for: .normal) ?? "", attributes: stroke)
        
    }
    
    private let showModalButton: UIButton = {
        let showModalButton = UIButton(type: .system)
        showModalButton.setTitle("About me", for: .normal)
        showModalButton.titleLabel?.font = .systemFont(ofSize: 32, weight: .bold)
        showModalButton.tintColor = .white
        showModalButton.backgroundColor = .black
        showModalButton.layer.cornerRadius = 25
        
        return showModalButton
    }()
    
    //MARK: - Loadview
    override func loadView() {
        setupUI()
        constraints()
        setupAction()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Setup UI
    private func setupUI() {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(profilPicture)
        view.addSubview(showModalButton)
        
        
        self.view = view
        
//        let stroke: [NSAttributedString.Key : Any] = [
//            .strokeColor : UIColor.white,
//            .foregroundColor : UIColor.black,
//            .strokeWidth : 2.0,
//        ]
//        
//        let attributedString = NSAttributedString(string: showModalButton.title(for: .normal) ?? "", attributes: stroke)
//        showModalButton.setAttributedTitle(attributedString, for: .normal)
        
    }
    
    //MARK: - Setup Constraints
    private func constraints() {
        profilPicture.translatesAutoresizingMaskIntoConstraints = false
        showModalButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profilPicture.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            profilPicture.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            profilPicture.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
            profilPicture.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            
            showModalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showModalButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            showModalButton.widthAnchor.constraint(equalToConstant: 200),
            showModalButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
        ])
    }
    
    //MARK: - Setup Actions
    private func setupAction() {
        showModalButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        
    }
    
    
    @objc func showModal() {
        let destinationVC = ModalViewController()
        if let sheet = destinationVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.selectedDetentIdentifier = .medium
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        
        present(destinationVC, animated: true)
    }
}

