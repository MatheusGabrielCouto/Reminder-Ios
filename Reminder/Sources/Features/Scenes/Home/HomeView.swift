//
//  HomeView.swift
//  Reminder
//
//  Created by Arthur Rios on 20/10/24.
//

import Foundation
import UIKit

class HomeView: UIView {
  weak public var delegate: HomeViewDelegate?
  var tapAction: (() -> Void)?
  
  let profileBackground: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.gray600
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let contentBackground: UIView = {
    let view = UIView()
    view.layer.cornerRadius = Metrics.medium
    view.layer.masksToBounds = true
    view.backgroundColor = Colors.gray800
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let profileImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.isUserInteractionEnabled = true
    imageView.layer.cornerRadius = Metrics.medium
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  let welcomeLabel: UILabel = {
    let label = UILabel()
    label.text = "home.welcome.label".localized
    label.font = Typography.input
    label.textColor = Colors.gray200
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let nameTextField: UITextField = {
    let textfield = UITextField()
    textfield.font = Typography.heading
    textfield.textColor = Colors.gray100
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.placeholder = "Insira o seu nome"
    textfield.returnKeyType = .done
    return textfield
  }()
  
  let myPrescriptionButton: ButtonHomeView = {
    let button = ButtonHomeView(
      icon: UIImage(named: "paper")!,
      title: "Minhas Receitas",
      description: "Acompanhe os medicamentos e gerencie lembretes")
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
    
  }()
  
  let newPrescriptionButton: ButtonHomeView = {
    let button = ButtonHomeView(
      icon: UIImage(named: "pills")!,
      title: "Nova receita",
      description: "Cadastre novos lembretes de receitas")
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
    
  }()

  let feedbackButton: UIButton = {
    let button = UIButton()
    button.setTitle("home.feedback.button.title".localized, for: .normal)
    button.backgroundColor = Colors.gray100
    button.layer.cornerRadius = Metrics.medium
    button.setTitleColor(.white, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    
    setupTextField()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    addSubview(profileBackground)
    profileBackground.addSubview(profileImage)
    profileBackground.addSubview(welcomeLabel)
    profileBackground.addSubview(nameTextField)

    addSubview(contentBackground)
    contentBackground.addSubview(feedbackButton)
    contentBackground.addSubview(newPrescriptionButton)
    contentBackground.addSubview(myPrescriptionButton)

    setupConstraints()
    setupImageGesture()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      profileBackground.topAnchor.constraint(equalTo: topAnchor),
      profileBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
      profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
      profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),

      profileImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: Metrics.little),
      profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.medium),
      profileImage.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
      profileImage.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),

      welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.small),
      welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),

      nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.tiny),
      nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),

      feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
      feedbackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.medium),
      feedbackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
      feedbackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
      
      myPrescriptionButton.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.medium),
      myPrescriptionButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medier),
      myPrescriptionButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medier),
      myPrescriptionButton.heightAnchor.constraint(equalToConstant: 112),
      
      newPrescriptionButton.topAnchor.constraint(equalTo: myPrescriptionButton.bottomAnchor, constant: Metrics.medier),
      newPrescriptionButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medier),
      newPrescriptionButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medier),
      newPrescriptionButton.heightAnchor.constraint(equalToConstant: 112),

      contentBackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor),
      contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
      contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
  
  private func setupImageGesture() {
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
    profileImage.addGestureRecognizer(tapGestureRecognizer)
  }
  
  private func setupTextField() {
    nameTextField.addTarget(self, action: #selector(nameTextFieldDidEndEditing), for: .editingDidEnd)
    
    nameTextField.delegate = self
  }

  
  @objc
  private func profileImageTapped() {
    delegate?.didTapProfileImage()
  }
  
  @objc
  private func nameTextFieldDidEndEditing() {
    let username = nameTextField.text ?? ""
    UserDefaultsManager.saveUserName(username)
  }
}

extension HomeView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    let username = nameTextField.text ?? ""
    UserDefaultsManager.saveUserName(username)
    return true
  }
}
