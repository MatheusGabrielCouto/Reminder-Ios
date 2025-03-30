//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Matheus Gabriel on 29/03/25.
//

import Foundation

class UserDefaultsManager {
  private static let userKey = "userKey"
  
  static func saveUser(user: User) {
    let encoder = JSONEncoder()
    if let encoder = try? encoder.encode(user) {
      UserDefaults.standard.set(encoder, forKey: userKey)
      UserDefaults.standard.synchronize()
    }
  }
  
  static func loadUser() -> User? {
    if let userData = UserDefaults.standard.data(forKey: userKey) {
      let decoder = JSONDecoder()
      return try? decoder.decode(User.self, from: userData)
    }
    else {
      return nil
    }
  }
}
