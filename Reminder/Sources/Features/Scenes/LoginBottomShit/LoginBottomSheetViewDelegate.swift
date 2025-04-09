//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Matheus Gabriel on 28/03/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
  func sendLoginData(user: String, password: String)
}
