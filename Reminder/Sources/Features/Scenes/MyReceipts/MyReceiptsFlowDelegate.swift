//
//  MyReceiptsFlowDelegate.swift
//  Reminder
//
//  Created by Matheus Gabriel on 06/04/25.
//

import Foundation

public protocol MyReceiptsFlowDelegate: AnyObject {
  func goToNewReceipt()
  func didTapBackButton()
}
