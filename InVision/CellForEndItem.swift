//
//  CellForEndItem.swift
//  InVision
//
//  Created by USER on 11/24/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class CellForEndItem: UITableViewCell {
    @IBOutlet weak var offerImgView: UIImageView!
    @IBOutlet weak var botleImgView: UIImageView!
    @IBOutlet weak var botleName: UILabel!
    @IBOutlet weak var botleTypeLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var counterBtn: UIButton!
    @IBOutlet weak var incrementBtn: UIButton!
    @IBOutlet weak var decreamentBtn: UIButton!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var realPriceLbl: UILabel!
    @IBOutlet weak var offeredPriceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name(rawValue: "increamentDecreament"), object: nil)
        incrementBtn.isHidden = true
        decreamentBtn.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI() {
        //incrementBtn.isHidden = false
        //decreamentBtn.isHidden = false
    }
}
