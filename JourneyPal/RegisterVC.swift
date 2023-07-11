//
//  RegisterVC.swift
//  JourneyPal
//
//  Created by Ece Havanci on 10.07.2023.
//

import UIKit
import PhoneNumberKit

class RegisterVC: UIViewController {
    let phoneNumberKit = PhoneNumberKit()
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //doIt()
        // Do any additional setup after loading the view.
    }

    func doIt(){
        //passwordTextField.
        do {
            let phoneNumber = try phoneNumberKit.parse(passwordTextField.text!)
            let phoneNumberCustomDefaultRegion = try phoneNumberKit.parse(passwordTextField.text!, withRegion: "TR", ignoreType: true)
        }
        catch {
            print("Generic parser error")
        }
    
    }
    

}
