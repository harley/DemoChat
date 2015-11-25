//
//  ChatViewController.swift
//  ChatParse
//
//  Created by Harley Trung on 11/25/15.
//  Copyright © 2015 cheetah.com. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageField: UITextField!
    @IBAction func onSendButtonTapped(sender: UIButton) {
        // save data to Parse
        let message = PFObject(className:"Message")
        message["text"] = messageField.text!
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            guard success == true else {
                print("Failed: ", error!.description)
                // TODO: display alert message
                return
            }

            print("message saved")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
