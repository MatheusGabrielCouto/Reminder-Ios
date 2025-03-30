//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Arthur Rios on 10/10/24.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
  public weak var delegate: LoginBottomSheetViewDelegate?

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "login.welcome.title".localized
    label.isUserInteractionEnabled = true
    label.font = Typography.subHeading
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let emailTextFieldLabel: UILabel = {
    let label = UILabel()
    label.text = "login.email.label".localized
    label.isUserInteractionEnabled = true
    label.font = Typography.label
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let emailTextField: UITextField = {
    let text = UITextField()
    text.placeholder = "login.email.placeholder".localized
    text.borderStyle = .roundedRect
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()
  
  private let passwordTextFieldLabel: UILabel = {
    let label = UILabel()
    label.text = "login.password.label".localized
    label.isUserInteractionEnabled = true
    label.font = Typography.label
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let passwordTextField: UITextField = {
    let text = UITextField()
    text.placeholder = "login.password.placeholder".localized
    text.borderStyle = .roundedRect
    text.isSecureTextEntry = true
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
  }()

  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("login.button.title".localized, for: .normal)
    button.backgroundColor = Colors.primaryRedBase
    button.layer.cornerRadius = Metrics.medium
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = Typography.subHeading
    button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()

    let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampleTap))
    
    titleLabel.addGestureRecognizer(exampleGest)
  }
  
  @objc
  private func exampleTap() {
    print("Teste")
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    self.backgroundColor = .white
    self.layer.cornerRadius = Metrics.small

    addSubview(titleLabel)
    addSubview(emailTextFieldLabel)
    addSubview(emailTextField)
    addSubview(passwordTextFieldLabel)
    addSubview(passwordTextField)
    addSubview(loginButton)

    setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([

      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.tiny),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      
      emailTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
      emailTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),

      emailTextField.topAnchor.constraint(equalTo: emailTextFieldLabel.bottomAnchor, constant: Metrics.small),
      emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
      emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
      
      passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
      passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),

      passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.small),
      passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
      passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

      loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.huge),
      loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
      loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
      loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
      loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
    ])
  }
  
  @objc
  private func loginButtonTapped() {
    let password = passwordTextField.text ?? ""
    let user = emailTextField.text ?? ""
    delegate?.sendLoginData(user: user, password: password)
  }
}
