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
        registerButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
    }
    
    //@TODO add
    @objc func Register(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!)
        { authResult, error in
            Alert().showSimpleAlert(controller: self,message: authResult?.description ?? "",title: "")
        }
        print("registered")
    }
    
    @objc func didTapSignUpButton() {
        if let name = nameTextField.text, name.isEmpty{
            Alert().showSimpleAlert(controller: self,message: "Please write your name", title: "Missing Information")
        }
        else if let surn = surnameTextField.text, surn.isEmpty{
            Alert().showSimpleAlert(controller: self,message: "Please write your surname", title: "Missing Information")
        }
        else if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password)
            { authResult, error in
                if let maybeError = error{
                    let err = maybeError as NSError
                    switch err.code{
                    case AuthErrorCode.invalidEmail.rawValue:
                        Alert().showSimpleAlert(controller: self,message: authResult?.description ?? "",title: "Please write your email again")
                        break
        
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        Alert().showSimpleAlert(controller: self,message: "Email is already used.",title: "Please write new email")
                        break;
                    case AuthErrorCode.weakPassword.rawValue:
                        Alert().showSimpleAlert(controller: self,message: err.localizedDescription, title: "Weak password!")
                        break;
                    default:
                        Alert().showSimpleAlert(controller: self,message: err.localizedDescription, title: "!")
                    }
                }
                else{
                    if let _ = authResult?.user{
                        Alert().showSimpleAlert(controller: self,message: "Please sign in to begin.", title: "Registered!")
                        print("user is registered")
                    }else{
                        print("sth went wrong")
                    }
                }
                
                
            }
        }
        else if let phon = phoneTextField.text, phon.isEmpty{
            Alert().showSimpleAlert(controller: self,message: "Please write your phone number", title: "Missing Information")
        }
        
    }
}
