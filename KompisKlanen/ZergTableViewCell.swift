//
//  ZergTableViewCell.swift
//  KompisKlanen
//
//  Created by Robert Elfström on 2017-02-16.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit

class ZergTableViewCell: UITableViewCell {
    
    @IBOutlet weak var buildTitleLabel: UILabel!
    @IBOutlet weak var buildRvRLabel: UILabel!
    @IBOutlet weak var buildDescLabel: UILabel!
    @IBOutlet weak var buildImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
