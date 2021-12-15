//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Juanpablo Sánchez G. on 08/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

final class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = messageLabel.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
