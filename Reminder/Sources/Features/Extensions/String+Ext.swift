//
//  String+Ext.swift
//  Reminder
//
//  Created by Matheus Gabriel on 27/03/25.
//

import Foundation

extension String {
  var localized: String {
    return NSLocalizedString(self, comment: "")
  }
}
