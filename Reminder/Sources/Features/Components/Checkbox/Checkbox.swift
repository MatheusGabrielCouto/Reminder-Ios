//
//  Checkbox.swift
//  Reminder
//
//  Created by Matheus Gabriel on 31/03/25.
//

import Foundation
import UIKit

public class Checkbox: UIView {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = Typography.label
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let checkbox: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "square"), for: .normal)
    button.tintColor = Colors.gray400
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  init(title: String) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.text = title
    
    addSubview(titleLabel)
    addSubview(checkbox)
    
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
      checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
      checkbox.widthAnchor.constraint(equalToConstant: 24),
      checkbox.heightAnchor.constraint(equalToConstant: 24),
      
      titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: Metrics.small),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
  
  
}
