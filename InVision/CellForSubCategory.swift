//
//  CellForSubCategory.swift
//  InVision
//
//  Created by USER on 11/24/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class CellForSubCategory: UITableViewCell {
    @IBOutlet weak var subCategoryListLbl: UILabel!
    @IBOutlet weak var numberOfItems: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
