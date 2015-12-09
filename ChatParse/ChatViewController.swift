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
    var messages = [PFObject]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 30

        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "fetchMessages", userInfo: nil, repeats: true)
    }

    func fetchMessages() {
        let query = PFQuery(className: "Message")
        query.includeKey("user")
        query.orderByDescending("createdAt")

        query.findObjectsInBackgroundWithBlock { (messages: [PFObject]?, error: NSError?) -> Void in
            guard let messages = messages else {
                print("Error fetching messages", error!.description)
                return
            }

            self.messages = messages
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var composeTextField: UITextField!
    @IBAction func onSendButtonTapped(sender: UIButton) {
        // save data to Parse
        let message = PFObject(className:"Message")
        message["text"] = composeTextField.text!
        message["user"] = PFUser.currentUser()
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            guard success == true else {
                print("Failed: ", error!.description)
                // TODO: display alert message
                return
            }

            self.composeTextField.text = ""
        }
    }


    @IBAction func onLogoutTapped(sender: UIBarButtonItem) {
        PFUser.logOut()
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! MessageCell
        cell.message = messages[indexPath.row]
        return cell
    }
}