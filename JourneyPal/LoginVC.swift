//
//  LoginVC.swift
//  JourneyPal
//
//  Created by Ece Havanci on 10.07.2023.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
   
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
