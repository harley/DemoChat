//
//  MessageCell.swift
//  ChatParse
//
//  Created by Harley Trung on 11/25/15.
//  Copyright © 2015 cheetah.com. All rights reserved.
//

import UIKit
import Parse
import DateTools

class MessageCell: UITableViewCell {
    @IBOutlet weak var messageTextLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!

    var message: PFObject! {
        didSet {
            messageTextLabel.text = message["text"] as? String
            if let user = message["user"] as? PFUser {
                userLabel.text = user.username
            } else {
                userLabel.text = "<ghost>"
            }
            timeAgoLabel.text = message.createdAt!.shortTimeAgoSinceNow()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
