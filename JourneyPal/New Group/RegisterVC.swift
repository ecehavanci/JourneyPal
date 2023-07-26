//
//  RegisterVC.swift
//  JourneyPal
//
//  Created by Ece Havanci on 10.07.2023.
//

import UIKit
import PhoneNumberKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class RegisterVC: UIViewController {
    let phoneNumberKit = PhoneNumberKit()
    
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let db = Firestore.firestore()
    
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
        else if let phon = phoneTextField.text, phon.isEmpty{
            Alert().showSimpleAlert(controller: self,message: "Please write your phone number", title: "Missing Information")
        }
        else if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password)
            { [self] authResult, error in
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
                         var UID:String? = authResult?.user.uid;
                        
                        // Add a new document with a generated ID
                        var ref: DocumentReference? = nil
                        ref = self.db.collection("users").addDocument(data: [
                            "ID": UID,
                            "first": self.nameTextField.text,
                            "last": self.surnameTextField.text,
                            "email": self.emailTextField.text,
                            "phone":self.phoneTextField.text
                        ]) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                print("Document added with ID: \(ref!.documentID)")
                            }
                        }
                        Alert().showSimpleAlert(controller: self,message: "Please sign in to begin.", title: "Registered!")
                        print("user is registered")
                       
                    }else{
                        print("sth went wrong")
                    }
                }
                
                
            }
        }
        
        
    }
}
