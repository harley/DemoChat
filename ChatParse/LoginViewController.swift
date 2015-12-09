//
//  LoginViewController.swift
//  ChatParse
//
//  Created by Harley Trung on 11/25/15.
//  Copyright © 2015 cheetah.com. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    @IBAction func onSignupTapped(sender: UIButton) {
        let user = PFUser()
        user.username = emailField.text!
        user.password = passwordField.text!
        user.email    = emailField.text!

        user.signUpInBackgroundWithBlock { (succeeded: Bool, error : NSError?) -> Void in
            guard succeeded else {
                let errorMessage = error!.userInfo["error"] as! String
                self.displayAlert(errorMessage)
                return
            }

            self.performSegueWithIdentifier("loggedInSegue", sender: self)
        }
    }

    @IBAction func onLoginTapped(sender: UIButton) {
        print("logging in:", emailField.text!, passwordField.text!)
        PFUser.logInWithUsernameInBackground(emailField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            guard error == nil else {
                let errorMessage = error!.userInfo["error"] as! String
                self.displayAlert(errorMessage)
                return
            }

            self.performSegueWithIdentifier("loggedInSegue", sender: self)
        }
    }

    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Authentication", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
}
