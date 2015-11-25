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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignupTapped(sender: UIButton) {
        print("signing in", emailField.text, passwordField.text)

        let user = PFUser()
        user.username = emailField.text!
        user.password = passwordField.text!
        user.email    = emailField.text!

        user.signUpInBackgroundWithBlock { (succeeded: Bool, error : NSError?) -> Void in
            if succeeded {
                print("sign up successfully")
                self.performSegueWithIdentifier("loggedInSegue", sender: self)
            } else {
                print("Error: ", error!.description)
                let errorMessage = error!.userInfo["error"] as! String
                self.displayAlert(errorMessage)
            }
        }
    }

    @IBAction func onLoginTapped(sender: UIButton) {
        print("logging in", emailField.text, passwordField.text)
        PFUser.logInWithUsernameInBackground(emailField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            guard error == nil else {
                print("error logging in: ", error!.description)
                let errorMessage = error!.userInfo["error"] as! String
                self.displayAlert(errorMessage)
                return
            }

            print("logging in successfully")
            self.performSegueWithIdentifier("loggedInSegue", sender: self)
        }
    }

    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Authentication", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
}
