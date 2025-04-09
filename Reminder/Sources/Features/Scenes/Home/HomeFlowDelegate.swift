//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Matheus Gabriel on 30/03/25.
//

import Foundation

protocol HomeFlowDelegate: AnyObject {
  func navigateToRecipes()
  func logout()
  func navigateToMyRecipes()
}
