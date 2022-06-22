//
//  ViewController.swift
//  UserDefaultsBestPractices
//
//  Created by Raj Rathod on 17/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var viewBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didtapLogin(_ sender: Any) {
        if isValid() {
            SavedData.clearData()
            SavedData.customerEmail = emailTF.text ?? ""
            SavedData.customerPassword = passwordTF.text ?? ""
            self.showMessage(title: "Login Success!", msg: "Data is saved successfully.")

            /* To save data in large amount*/
          //  SavedData.authenticateUser(emailTF.text ?? "", passwordTF.text ?? "")
        }
    }
    
    @IBAction func didtapView(_ sender: Any) {
        if isValidData() {
            let savedData = "Email: \(SavedData.customerEmail ?? "")" + "\nPassword: \(SavedData.customerPassword ?? "")"
            self.showMessage(title: "Saved Data", msg: savedData)
        }
    }
    
    func showMessage(title: String, msg: String)  {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // MARK:- Validating input fields
    func isValid() -> Bool {
        if emailTF.text?.isEmpty ?? false {
            self.showMessage(title: "Invalid email", msg: "Please enter valid email")
            return false
        }
        if passwordTF.text?.isEmpty ?? false {
            self.showMessage(title: "Invalid password", msg: "Please enter valid password")
            return false
        }
        return true
    }

    // MARK:- Validating input fields
    func isValidData() -> Bool {
        if SavedData.customerEmail?.isEmpty ?? false {
            self.showMessage(title: "No data found", msg: "Please login by entering valid email and password")
            return false
        }
        if SavedData.customerPassword?.isEmpty ?? false {
            self.showMessage(title: "No data found", msg: "Please login by entering valid email and password")
            return false
        }
        return true
    }
}

