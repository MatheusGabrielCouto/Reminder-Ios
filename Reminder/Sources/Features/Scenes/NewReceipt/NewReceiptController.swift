//
//  NewReceipt.swift
//  Reminder
//
//  Created by Matheus Gabriel on 31/03/25.
//

import Foundation
import UIKit

class NewReceiptController: UIViewController {
  private let newReceiptView = NewReceiptView()
  private let viewModel = NewReceiptViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupActions()
    self.navigationController?.navigationBar.isHidden = true
  }
  
  private func setupView() {
    view.backgroundColor = Colors.gray800
    view.addSubview(newReceiptView)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    newReceiptView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      newReceiptView.topAnchor.constraint(equalTo: view.topAnchor),
      newReceiptView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      newReceiptView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      newReceiptView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  private func setupActions() {
    newReceiptView.backButton.addTarget(self, action: #selector(backbuttonTapped), for: .touchUpInside)
    newReceiptView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
  }
  
  @objc private func backbuttonTapped() {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc private func addButtonTapped() {
    let remedy = newReceiptView.remmedyInput.getText() ?? ""
    let time = newReceiptView.timeInput.getText() ?? ""
    let recurrence = newReceiptView.recurrenceInput.getText() ?? ""
    let takeNow = newReceiptView.switchButton.isOn
    
    viewModel.addReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    
    print("receita \(remedy) adicionada")
  }
  
}
