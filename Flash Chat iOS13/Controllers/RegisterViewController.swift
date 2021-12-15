//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

final class RegisterViewController: UIViewController {

    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    
    @IBAction private func registerPressed(_ sender: UIButton) {
        
        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let e = error {
                print(e.localizedDescription)
            } else {
                self.performSegue(withIdentifier: Constant.registerSegue, sender: self)
            }
          
        }
        
    }
    
}
