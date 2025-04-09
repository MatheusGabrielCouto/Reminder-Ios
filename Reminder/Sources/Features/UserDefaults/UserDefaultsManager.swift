//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Matheus Gabriel on 29/03/25.
//

import Foundation
import UIKit

class UserDefaultsManager {
  private static let userKey = "userKey"
  private static let userNameKey = "userName"
  private static let userProfileKey = "userProfile"
  
  static func saveUser(user: User) {
    let encoder = JSONEncoder()
    if let encoder = try? encoder.encode(user) {
      UserDefaults.standard.set(encoder, forKey: userKey)
      UserDefaults.standard.synchronize()
    }
  }
  
  static func saveUserName(_ name: String) {
    UserDefaults.standard.set(name, forKey: userNameKey)
    UserDefaults.standard.synchronize()
  }
  
  static func saveProfileImage(image: UIImage) {
    if let imageData = image.jpegData(compressionQuality: 1.0) {
      UserDefaults.standard.set(imageData, forKey: userProfileKey)
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
  
  static func loadUserName() -> String? {
    return UserDefaults.standard.string(forKey: userNameKey)
  }
  
  static func loadProfileImage() -> UIImage? {
    if let imageData = UserDefaults.standard.data(forKey: userProfileKey) {
      return UIImage(data: imageData)
    }
    
    return UIImage(named: "user")
  }
  
  static func removeUser() {
    UserDefaults.standard.removeObject(forKey: userKey)
    UserDefaults.standard.removeObject(forKey: userProfileKey)
    UserDefaults.standard.removeObject(forKey: userNameKey)
    UserDefaults.standard.synchronize()
  }
  
  static func removeUserName() {
    UserDefaults.standard.removeObject(forKey: userNameKey)
    UserDefaults.standard.synchronize()
  }
}
