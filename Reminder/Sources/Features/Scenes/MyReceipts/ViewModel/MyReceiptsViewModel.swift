//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Matheus Gabriel on 08/04/25.
//

import Foundation

class MyReceiptsViewModel {
  func fetchData() -> [Medicine] {
    return DBHelper.shared.fetchReceipts()
  }
  
  func deleteReceipt(byId id: Int) {
    DBHelper.shared.deletReceiot(byId: id)
  }
}
