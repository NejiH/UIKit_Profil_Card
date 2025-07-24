//
//  ModalViewController.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 23/07/2025.
//

import UIKit

class ModalViewController: UIViewController {
    
    let viewModel = ModalViewModel()
    
    
    // MARK: - UI Componants
    private let modalView: UIView = {
        let modalView = UIView()
        modalView.backgroundColor = .white
        modalView.layer.cornerRadius = 30
        
        return modalView
    }()
    
    private let gradientView: UIView = {
        let gradientView = UIView()
        gradientView.layer.cornerRadius = 30
        gradientView.clipsToBounds = true
        
        return gradientView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    private let closeModalButton: UIButton = {
        let closeModalButton = UIButton(type: .system)
        closeModalButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeModalButton.tintColor = .black
        
        
        
        return closeModalButton
    }()
    
    private let containerView: UIView = {
        let container = UIView()
        return container
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        //        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 0
        
        return stackView
    }()
    
    private let locationPinView: UIImageView = {
        let pin = UIImageView()
        pin.image = UIImage(systemName: "mappin.and.ellipse.circle.fill")
        pin.contentMode = .scaleAspectFit
        pin.tintColor = UIColor(white: 1.0, alpha: 0.8)
        pin.clipsToBounds = true
        
        return pin
    }()
    
    private lazy var locationName: UILabel = {
        let label = viewModel.locationLabelViewModel(city: "Paris")
        
        return label
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Arnaud HAYON"
        nameLabel.textAlignment = .left
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 36, weight: .bold)
        
        return nameLabel
    }()
    
    private let jobLabel: UILabel = {
        let jobLabel = UILabel()
        jobLabel.text = "Dev iOS"
        jobLabel.textAlignment = .left
        jobLabel.font = .systemFont(ofSize: 20, weight: .bold)
        jobLabel.textColor = UIColor(white: 1.0, alpha: 0.8)
        
        return jobLabel
    }()
    
    private let skillLabel: UILabel = {
        let skill = UILabel()
        skill.text = "Skills"
        skill.textAlignment = .left
        skill.font = .systemFont(ofSize: 20, weight: .bold)
        skill.textColor = UIColor(white: 1.0, alpha: 0.8)
        
        return skill
    }()
    
    
    
    private let logoImages: [UIImage] = [
        UIImage(named: "logo-swift") ?? UIImage(systemName: "person.crop.circle")!,
        UIImage(named: "logo-swiftui") ?? UIImage(systemName: "person.crop.circle")!,
        UIImage(named: "logo-figma") ?? UIImage(systemName: "person.crop.circle")!,
        UIImage(named: "logo-github") ?? UIImage(systemName: "person.crop.circle")!,
    ]
    
    private lazy var aboutLabel: UILabel = {
        let label = viewModel.titleLabelViewModel(name: "ABOUT")
        return label
    }()
    
    private lazy var aboutDesc: UILabel = {
        let label = viewModel.descLabelViewModel(text: "I have over 10 years of experience in marketing, influence, and events, primarily in the video game and new technology sectors.\n\nCurrently, I’m training as an iOS developer to expand my skill set and stay aligned with market trends—whether to lead a team or be the one building the project.\n\nI’m highly driven and give my absolute best once I set my mind to something. I love sharing my experience, which is why I see every new opportunity as an exchange rather than a one-way interaction.")
        return label
    }()
    
    
    // MARK: - loadView
    override func loadView() {
        setupUI()
        setupAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        let view = UIView()
        view.addSubview(modalView)
        modalView.addSubview(gradientView)
        modalView.addSubview(closeModalButton)
        modalView.addSubview(nameLabel)
        modalView.addSubview(containerView)
        containerView.addSubview(jobLabel)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(locationPinView)
        stackView.addArrangedSubview(locationName)
        modalView.addSubview(collectionView)
        modalView.addSubview(skillLabel)
        modalView.addSubview(aboutLabel)
        modalView.addSubview(aboutDesc)
        
        
        
        self.view = view
        
        setupConstraints()
        
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        let views = [
            gradientView,
            closeModalButton,
            modalView,
            nameLabel,
            containerView,
            stackView,
            locationName,
            jobLabel,
            collectionView,
            skillLabel
        ]
        
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: modalView.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: modalView.bottomAnchor),
            
            closeModalButton.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 8),
            closeModalButton.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -8),
            closeModalButton.widthAnchor.constraint(equalToConstant: 30),
            closeModalButton.heightAnchor.constraint(equalToConstant: 30),
            
            modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: closeModalButton.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
            containerView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
            jobLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            jobLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: jobLabel.trailingAnchor, constant: 16),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor),
            
            skillLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
            skillLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            skillLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: skillLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            
            aboutLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            aboutLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
            aboutDesc.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 10),
            aboutDesc.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            aboutDesc.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            
        ])
    }
    
    //MARK: - Setup Gradient
    
    private func setupGradient() {
        // Supprimer les anciens gradients (évite les doublons lors des rotations)
        gradientView.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        
        // Gradient bleu vers violet
        gradientLayer.colors = [
            UIColor.systemRed.cgColor,
            UIColor.systemBrown.cgColor
        ]
        
        // Direction du gradient (vertical par défaut)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: - Actions
    private func setupAction (){
        closeModalButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
    }
    
    @objc func dismissModal() {
        self.dismiss(animated: true)
    }
    
}

extension ModalViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logoImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = logoImages[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItems: CGFloat = CGFloat(logoImages.count)
        let spacing: CGFloat = 10
        let totalSpacing = (numberOfItems - 1) * spacing
        let width = (collectionView.bounds.width - totalSpacing) / numberOfItems
        return CGSize(width: width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
