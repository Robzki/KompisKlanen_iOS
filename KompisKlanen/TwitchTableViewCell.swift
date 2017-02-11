//
//  TwitchTableViewCell.swift
//  KompisKlanen
//
//  Created by Robert Elfstrom on 2017-02-06.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit

class TwitchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var vidTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
