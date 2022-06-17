//
//  SavedData.swift
//  UserDefaultsBestPractices
//
//  Created by Raj Rathod on 17/06/22.
//

import Foundation

class SavedData: NSObject {
    // customer email
    class var customerEmail: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "customerEmail")
        } get {
            return UserDefaults.standard.value(forKey: "customerEmail") as? String ?? nil
        }
    }

    // customer password
      class var customerPassword: String? {
          set {
              UserDefaults.standard.setValue(newValue, forKey: "password")
          } get {
              return UserDefaults.standard.value(forKey: "password") as? String ?? ""
          }
      }

    // authenticate user
    class func authenticateUser( _ email:String, _ password: String) {
        customerEmail = email
        customerPassword = password
    }
    // clear user
    class func clearData() {
        customerEmail = nil
        customerPassword = nil
    }
}
