//
//  ModalViewController.swift
//  Exercice_UIKit_Perso
//
//  Created by Arnaud Hayon on 23/07/2025.
//

import UIKit
import MessageUI

class ModalViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
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
    
    private lazy var containerTopView: UIView = {
        let container = viewModel.containerViewModel()
        return container
    }()
    
    private lazy var hStackTopView: UIStackView = {
        let stackView = viewModel.HStackViewModel()
        
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
    
    private lazy var containerBottomView: UIView = {
        let container = viewModel.containerViewModel()
        return container
    }()
    
    private lazy var aboutLabel: UILabel = {
        let label = viewModel.titleLabelViewModel(name: "ABOUT")
        return label
    }()
    
    private lazy var aboutDesc: UILabel = {
        let label = viewModel.descLabelViewModel(text: "I have over 10 years of experience in marketing, influence, and events in the video games and hightech.\n\nI’m now training as an iOS developer. I love sharing my experience, which is why I see every new opportunity as an exchange rather than a one-way interaction.")
        return label
    }()
    
    private lazy var projectLabel: UILabel = {
        let label = viewModel.titleLabelViewModel(name: "PROJECT")
        return label
    }()
    
    private lazy var projectDesc: UILabel = {
        let label = viewModel.descLabelViewModel(text: "My next project is a narrative game in wich players will explore dreams to collect artefacts that will unveil their true identity.")
        return label
    }()
    
    private lazy var contactLabel: UILabel = {
        let label = viewModel.titleLabelViewModel(name: "CONTACT")
        return label
    }()
    
    private lazy var hStackBottomView: UIStackView = {
        let stackView = viewModel.HStackViewModel()
        
        return stackView
    }()
    
    private var buttonMail: UIButton = {
        let button = UIButton(type: .system)
        if let image = UIImage(named: "picto-mail") {
            button.setImage(image, for: .normal)
        } else {
            print("L'image n'a pas pu être chargée.")
        }
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    private var buttonLinkedIn: UIButton = {
        let button = UIButton(type: .system)
        if let image = UIImage(named: "picto-linkedin") {
            button.setImage(image, for: .normal)
        } else {
            print("L'image n'a pas pu être chargée.")
        }
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
      
        
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
        modalView.addSubview(containerTopView)
        containerTopView.addSubview(jobLabel)
        containerTopView.addSubview(hStackTopView)
        hStackTopView.addArrangedSubview(locationPinView)
        hStackTopView.addArrangedSubview(locationName)
        modalView.addSubview(collectionView)
        modalView.addSubview(skillLabel)
        modalView.addSubview(containerBottomView)
        containerBottomView.addSubview(aboutLabel)
        containerBottomView.addSubview(aboutDesc)
        containerBottomView.addSubview(projectLabel)
        containerBottomView.addSubview(projectDesc)
        modalView.addSubview(hStackBottomView)
        hStackBottomView.addSubview(buttonMail)
        hStackBottomView.addSubview(buttonLinkedIn)

        
        
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
            locationName,
            jobLabel,
            collectionView,
            skillLabel
        ]

        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        setupGradientViewConstraints()
        setupCloseModalButtonConstraints()
        setupModalViewConstraints()
        setupNameLabelConstraints()
        setupContainerTopViewConstraints()
        setupSkillLabelConstraints()
        setupCollectionViewConstraints()
        setupContainerBottomViewConstraints()
        setupHStackBottomViewConstraints()
    }
    
    private func setupGradientViewConstraints() {
        gradientView.pinToEdges(of: modalView)

    }
    
    private func setupModalViewConstraints() {
        modalView.pinToEdges(of: view, padding: 10)
    }

    private func setupCloseModalButtonConstraints() {
        NSLayoutConstraint.activate([
            closeModalButton.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 8),
            closeModalButton.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -8),
            closeModalButton.widthAnchor.constraint(equalToConstant: 30),
            closeModalButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    


    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: closeModalButton.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16)
        ])
    }

    private func setupContainerTopViewConstraints() {
        NSLayoutConstraint.activate([
            containerTopView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            containerTopView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            containerTopView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            jobLabel.leadingAnchor.constraint(equalTo: containerTopView.leadingAnchor),
            jobLabel.centerYAnchor.constraint(equalTo: containerTopView.centerYAnchor),
            hStackTopView.leadingAnchor.constraint(equalTo: jobLabel.trailingAnchor, constant: 16),
            hStackTopView.centerYAnchor.constraint(equalTo: containerTopView.centerYAnchor),
            hStackTopView.trailingAnchor.constraint(lessThanOrEqualTo: containerTopView.trailingAnchor)
        ])
    }

    private func setupSkillLabelConstraints() {
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: containerTopView.bottomAnchor, constant: 20),
            skillLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            skillLabel.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16)
        ])
    }

    private func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: skillLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    private func setupContainerBottomViewConstraints() {
        NSLayoutConstraint.activate([
            containerBottomView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            containerBottomView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            containerBottomView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            aboutLabel.leadingAnchor.constraint(equalTo: containerBottomView.leadingAnchor),
            aboutLabel.trailingAnchor.constraint(equalTo: containerBottomView.trailingAnchor),
            aboutDesc.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 10),
            aboutDesc.leadingAnchor.constraint(equalTo: containerBottomView.leadingAnchor),
            aboutDesc.trailingAnchor.constraint(equalTo: containerBottomView.trailingAnchor),
            projectLabel.topAnchor.constraint(equalTo: aboutDesc.bottomAnchor, constant: 15),
            projectLabel.leadingAnchor.constraint(equalTo: containerBottomView.leadingAnchor),
            projectLabel.trailingAnchor.constraint(equalTo: containerBottomView.trailingAnchor),
            projectDesc.topAnchor.constraint(equalTo: projectLabel.bottomAnchor, constant: 10),
            projectDesc.leadingAnchor.constraint(equalTo: containerBottomView.leadingAnchor),
            projectDesc.trailingAnchor.constraint(equalTo: containerBottomView.trailingAnchor)
        ])
    }

    private func setupHStackBottomViewConstraints() {
        NSLayoutConstraint.activate([
            hStackBottomView.topAnchor.constraint(equalTo: projectDesc.bottomAnchor, constant: 50),
            hStackBottomView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            hStackBottomView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            hStackBottomView.heightAnchor.constraint(equalToConstant: 60),
            buttonMail.leadingAnchor.constraint(equalTo: hStackBottomView.leadingAnchor, constant: 60)
        ])
        buttonLinkedIn.widtHeightAnchor(padding: 48)
        buttonMail.widtHeightAnchor(padding: 48)
    }

    
    //MARK: - Setup Gradient
    
    private func setupGradient() {
        gradientView.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds
        
        gradientLayer.colors = [
            UIColor.systemRed.cgColor,
            UIColor.systemBrown.cgColor
        ]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    //MARK: - Actions
    private func setupAction (){
        closeModalButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        buttonMail.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        
        buttonLinkedIn.addTarget(self, action: #selector(openURL), for: .touchUpInside)
        
    }
    
    @objc func dismissModal() {
        self.dismiss(animated: true)
    }
    
    @objc func openURL() {
        if let url = URL(string: "https://www.linkedin.com/in/arnaudhayon/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func sendEmail() {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["contact@arnaudhayon.com"])
                mail.setSubject("Sujet de l'email")
                mail.setMessageBody("<p>Corps de l'email</p>", isHTML: true)

                present(mail, animated: true)
            } else {
                // Montrez une alerte si l'envoi d'email n'est pas possible
                let alert = UIAlertController(title: "Erreur", message: "Impossible d'envoyer l'email", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true)
            }
        }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
           controller.dismiss(animated: true)
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
