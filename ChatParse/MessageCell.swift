//
//  MessageCell.swift
//  ChatParse
//
//  Created by Harley Trung on 11/25/15.
//  Copyright © 2015 cheetah.com. All rights reserved.
//

import UIKit
import Parse

class MessageCell: UITableViewCell {
    @IBOutlet weak var messageTextLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!

    var message: PFObject! {
        didSet {
            messageTextLabel.text = message["text"] as? String
            let user = message["user"] as? PFUser
            userLabel.text = user?.username ?? "<ghost>"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}