//
//  RegisterVC.swift
//  JourneyPal
//
//  Created by Ece Havanci on 10.07.2023.
//

import UIKit
import PhoneNumberKit
import FirebaseAuth

class RegisterVC: UIViewController {
    let phoneNumberKit = PhoneNumberKit()
    
    @IBOutlet var registerButton: UIButton!

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self, action: #selector(Register), for: .touchUpInside)
  
        //doIt()
        // Do any additional setup after loading the view.
    }

    /*func doIt(){
        //passwordTextField.
        do {
            let phoneNumber = try phoneNumberKit.parse(passwordTextField.text!)
            let phoneNumberCustomDefaultRegion = try phoneNumberKit.parse(passwordTextField.text!, withRegion: "TR", ignoreType: true)
        }
        catch {
            print("Generic parser error")
        }
    
    }*/
    @objc func Register(){
       /* print(nameTextField.text!,surnameTextField.text!,emailTextField.text!,emailTextField.text!,phonetextField.text!,passwordTextField.text!)*/
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
          // ...
            print(error,"error")
            print(authResult,"authResult")
        }
        print("registered")
    }

}
