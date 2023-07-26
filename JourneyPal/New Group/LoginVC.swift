//
//  LoginVC.swift
//  JourneyPal
//
//  Created by Ece Havanci on 10.07.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginVC: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet var passwordTextField: UITextField!
   
    @IBOutlet var usernameTextField: UITextField!
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener { auth, user in
          // ...
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameTextField.becomeFirstResponder()
    }
    
    
    @IBAction func signInTap(_ sender: UIButton) {
        if let email = usernameTextField.text, let pass = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: pass) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let maybeError = error{
                    let err = maybeError as NSError;
                    switch err.code{
                    case AuthErrorCode.invalidEmail.rawValue:
                        Alert().showSimpleAlert(controller: self!,message: "Invalid email",title: "Please write your email again")
                        break;
                        
                    default:
                        Alert().showSimpleAlert(controller: self!,message: "Can not sign in",title: "Please check your information.");
                    }
                    
                }
                else{
                    if let _ = authResult?.user{
                        let homeVC = HomeVC()
                        self!.performSegue(withIdentifier: "goHome", sender: nil)
                    }
                }
                
            }
        }
        
    }
    
    
    @IBAction func createNewAccount(_ sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        print(password!)
        print(username!)

    }

}
