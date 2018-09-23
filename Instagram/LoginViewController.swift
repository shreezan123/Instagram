//
//  LoginViewController.swift
//  Instagram
//
//  Created by Shrijan Aryal on 9/22/18.
//  Copyright © 2018 Shrijan Aryal. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func onSignIn(_ sender: Any) {
        
        let username = self.usernameField.text ?? ""
        let password = self.passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user:PFUser?, error:Error?) in
            if user != nil{
                print ("user logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
            }
            if let error = error{
                print ("User login failed with error as: \(error.localizedDescription)")
            }
        }
    
    
    }
    
    
    @IBAction func onSignOut(_ sender: Any) {
        
        let newUser = PFUser()
        let username = self.usernameField.text ?? ""
        let password = self.passwordField.text ?? ""
        newUser.username = username
        newUser.password = password
        newUser.signUpInBackground { (success:Bool, error:Error?) -> Void in
            if success{
                print("User has been created")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print (error?.localizedDescription)
            
            }
        }
        
        
     
        }
        
    
    
    }

