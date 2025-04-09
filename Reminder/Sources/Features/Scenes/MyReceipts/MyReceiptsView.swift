//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by Matheus Gabriel on 05/04/25.
//

import Foundation
import UIKit

class MyReceiptsView: UIView {
  weak public var delegate: MyReceiptsFlowDelegate?

  let headerBackgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = Colors.gray600
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let backButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
    button.tintColor = Colors.gray100
    button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  let addButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "add-button"), for: .normal)
    button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Minhas Receitas"
    label.textColor = Colors.primaryBlueBase
    label.font = Typography.heading
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subtitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Acompanhe seus medicamentos cadastrados e gerencie lembretes."
    label.font = Typography.body
    label.textColor = Colors.gray200
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let contentBackground: UIView = {
    let view = UIView()
    view.layer.cornerRadius = Metrics.medium
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    view.layer.masksToBounds = true
    view.backgroundColor = Colors.gray800
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    addSubview(headerBackgroundView)
    headerBackgroundView.addSubview(backButton)
    headerBackgroundView.addSubview(addButton)
    headerBackgroundView.addSubview(titleLabel)
    headerBackgroundView.addSubview(subtitleLabel)
    
    addSubview(contentBackground)
    
    contentBackground.addSubview(tableView)

    setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      headerBackgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.medier),
      headerBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      headerBackgroundView.heightAnchor.constraint(
        equalToConstant: Metrics.backgroundProfileSize),
      
      
      backButton.topAnchor.constraint(equalTo: headerBackgroundView.topAnchor, constant: -Metrics.small),
      backButton.leadingAnchor.constraint(equalTo: headerBackgroundView.leadingAnchor, constant: Metrics.medium),
      backButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
      
      addButton.topAnchor.constraint(equalTo: headerBackgroundView.topAnchor, constant: -Metrics.small),
      addButton.trailingAnchor.constraint(equalTo: headerBackgroundView.trailingAnchor, constant: -Metrics.medium),
      
      titleLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: Metrics.small),
      titleLabel.leadingAnchor.constraint(equalTo: headerBackgroundView.leadingAnchor, constant: Metrics.medium),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
      subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
      
      
      contentBackground.topAnchor.constraint(equalTo: headerBackgroundView.bottomAnchor, constant: -Metrics.small),
      contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
      contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      tableView.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.medium),
      tableView.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
      tableView.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
      tableView.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor),

    ])
  }
  
  @objc private func didTapBackButton() {
    delegate?.didTapBackButton()
  }
  
  @objc private func didTapAddButton() {
    delegate?.goToNewReceipt()
  }

}
