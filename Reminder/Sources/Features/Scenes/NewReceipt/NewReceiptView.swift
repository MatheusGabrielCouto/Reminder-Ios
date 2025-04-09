//
//  NewReceiptView.swift
//  Reminder
//
//  Created by Matheus Gabriel on 31/03/25.
//

import Foundation
import UIKit

class NewReceiptView: UIView {
  
  let backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
    button.tintColor = Colors.gray100
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = Typography.heading
    label.textColor = Colors.primaryRedBase
    label.text = "Nova Receita"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = Typography.body
    label.textColor = Colors.gray200
    label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu remédio."
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let addButton: UIButton = {
    let button = UIButton()
    button.setTitle("Cadastrar", for: .normal)
    button.titleLabel?.font = Typography.subHeading
    button.backgroundColor = Colors.primaryRedBase
    button.layer.cornerRadius = 12
    button.setTitleColor(Colors.gray800, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let remmedyInput = Input(title: "Remédio", placeholder: "Nome do medicamento")
  let timeInput = Input(title: "Horário", placeholder: "12:00")
  let recurrenceInput = Input(title: "Recorrência", placeholder: "Selecione")
  
  let timePicker: UIDatePicker = {
    let picker = UIDatePicker()
    picker.datePickerMode = .time
    picker.preferredDatePickerStyle = .wheels
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()
  
  let recurrencePicker: UIPickerView = {
    let picker = UIPickerView()
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()
  
  let recurrenceOptions = [
    "De hora em hora",
    "2 em 2 horas",
    "4 em 4 horas",
    "6 em 6 horas",
    "8 em 8 horas",
    "12 em 12 horas",
    "1 por dia",
  ]
  
  let switchButton: UISwitch = {
    let switchButton = UISwitch()
    switchButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    switchButton.translatesAutoresizingMaskIntoConstraints = false
    return switchButton
  }()
  
  let switchLabel: UILabel = {
    let label = UILabel()
    label.font = Typography.label
    label.textColor = Colors.gray100
    label.text = "Tomar agora"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    addSubview(backButton)
    
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(remmedyInput)
    addSubview(timeInput)
    addSubview(recurrenceInput)
    addSubview(switchButton)
    addSubview(switchLabel)
    
    addSubview(addButton)
    
    setupConstraints()
    setupRecurrenceInput()
    setupTimeInput()
    setupObservers()
    validateInputs()
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
      backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.small),
      backButton.heightAnchor.constraint(equalToConstant: 24),
      backButton.widthAnchor.constraint(equalToConstant: 24),
      
      titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.small),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
      
      remmedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.high),
      remmedyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      remmedyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
      
      timeInput.topAnchor.constraint(equalTo: remmedyInput.bottomAnchor, constant: Metrics.medier),
      timeInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      timeInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
      
      recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.medier),
      recurrenceInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      recurrenceInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),

      switchButton.topAnchor.constraint(equalTo: recurrenceInput.bottomAnchor, constant: Metrics.medium),
      switchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      
      switchLabel.leadingAnchor.constraint(equalTo: switchButton.trailingAnchor, constant: Metrics.medier),
      switchLabel.centerYAnchor.constraint(equalTo: switchButton.centerYAnchor),
      
      addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
      addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
      addButton.heightAnchor.constraint(equalToConstant: 56),
      addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.tiny)
    ])
  }
  
  private func setupTimeInput() {
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectTime))
    toolbar.setItems([doneButton], animated: true)
    
    timeInput.textField.inputView = timePicker
    timeInput.textField.inputAccessoryView = toolbar
  }
  
  private func setupRecurrenceInput() {
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectRecurrence))
    toolbar.setItems([doneButton], animated: true)
    
    recurrenceInput.textField.inputView = recurrencePicker
    recurrenceInput.textField.inputAccessoryView = toolbar
    
    recurrencePicker.delegate = self
    recurrencePicker.dataSource = self
  }
  
  private func validateInputs() {
    let isRemedyFillet = !(remmedyInput.textField.text ?? "").isEmpty
    let isTimeFillet = !(timeInput.textField.text ?? "").isEmpty
    let isRecurrenceFillet = !(recurrenceInput.textField.text ?? "").isEmpty
    
    addButton.isEnabled = isRemedyFillet && isTimeFillet && isRecurrenceFillet
    addButton.backgroundColor = addButton.isEnabled ? Colors.primaryRedBase : Colors.primaryRedBase.withAlphaComponent(0.5)
  }
  
  private func setupObservers() {
    remmedyInput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingChanged)
    timeInput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingChanged)
    recurrenceInput.textField.addTarget(self, action: #selector(inputDidChange), for: .editingChanged)
  }
  
  @objc private func inputDidChange() {
    validateInputs()
  }
  
  @objc private func didSelectRecurrence() {
    let selectedRow = recurrencePicker.selectedRow(inComponent: 0)
    
    recurrenceInput.textField.text = recurrenceOptions[selectedRow]
    recurrenceInput.textField.resignFirstResponder()
    validateInputs()
  }
  
  @objc private func didSelectTime() {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    timeInput.textField.text = formatter.string(from: timePicker.date)
    timeInput.textField.resignFirstResponder()
    validateInputs()
  }
}

extension NewReceiptView: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return recurrenceOptions.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return recurrenceOptions[row]
  }
  
}
