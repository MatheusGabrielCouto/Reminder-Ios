//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Matheus Gabriel on 02/04/25.
//

import Foundation

class NewReceiptViewModel {
  func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
    DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
  }
}
