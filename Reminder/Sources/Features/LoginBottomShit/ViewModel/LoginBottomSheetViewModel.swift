//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Matheus Gabriel on 28/03/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
  var succesResult: ((String) -> Void)?
  var errorResult: ((String) -> Void)?
  
  func doAuth(usernameLogin: String, password: String) {
    Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
      if let error = error {
        self?.errorResult?("Erro ao realizar o login, verifique as credenciais digitadas!")
      } else {
        self?.succesResult?(usernameLogin)
      }
    }
  }
}
