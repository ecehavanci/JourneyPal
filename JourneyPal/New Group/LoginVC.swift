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
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func SignIn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
        }
        
        print("signed in");
        
    }
    
    @IBAction func createNewAccount(_ sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        print(password!)
        print(username!)
        
        

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
