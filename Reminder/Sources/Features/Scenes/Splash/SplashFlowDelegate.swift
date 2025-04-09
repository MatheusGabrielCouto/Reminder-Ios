//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Matheus Gabriel on 29/03/25.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
  func openLoginBottomSheet()
  func navigateToHome()
}
