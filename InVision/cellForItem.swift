//
//  cellForItem.swift
//  InVision
//
//  Created by USER on 11/22/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class cellForItem: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
