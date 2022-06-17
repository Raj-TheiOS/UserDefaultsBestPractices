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
            SavedData.authenticateUser(emailTF.text ?? "", passwordTF.text ?? "")
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
            print("Invalid email")
            return false
        }
        if passwordTF.text?.isEmpty ?? false {
            print("Invalid password")
            return false
        }
        return true
    }

    // MARK:- Validating input fields
    func isValidData() -> Bool {
        if SavedData.customerEmail?.isEmpty ?? false {
            print("No data found")
            return false
        }
        if SavedData.customerPassword?.isEmpty ?? false {
            print("No data found")
            return false
        }
        return true
    }
}

