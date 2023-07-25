//
//  Alert.swift
//  JourneyPal
//
//  Created by Ece Havanci on 24.07.2023.
//

import UIKit
class Alert:NSObject{
    func showSimpleAlert(controller: UIViewController,message:String,title:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(
            UIAlertAction(title: "OK", style:UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            }))
            controller.present(alert, animated: true, completion: nil)
        }
}
