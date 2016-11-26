//
//  FirstViewController.swift
//  InVision
//
//  Created by USER on 11/22/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var gpsLblView : UIView!
    @IBOutlet weak var transparentBackgroundView: UIView!
    @IBOutlet weak var postcodeView: UIView!
    @IBOutlet weak var bellowView: UIView!
    @IBOutlet weak var gpsLbl : UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var img: [UIImage] = [
        UIImage(named: "155294_9273461_1703682_5558af0b_thumbnail.png")!,
        UIImage(named: "517402_9274938_1703682_fccd8dcb_thumbnail.png")!,
        UIImage(named: "Whole-Foods-logo.png")!,
        UIImage(named: "fresh-and-easy-logo.png")!,
        UIImage(named: "12222015-logo.png")!,
        UIImage(named: "new.png")!,
        UIImage(named: "new.png")!,
        UIImage(named: "12222015-logo.png")!,
    ]
    var Name: [String] = ["TESCO EXPRRESS", "ALDD", "GREEN MAP HASH", "SOPNO GROCETY","GROCERY MARKET", "NEW VISION SHOP", "SUPER SHOP", "SUPER SHOP"]
    var titleHead: [String] = ["Open Now (4)", "Close Now (2)"]
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        postcodeView.isHidden = true
        transparentBackgroundView.isHidden = true
        gpsLblView.isHidden = true
        searchView.isHidden = true
        bellowView.isHidden = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.gpsLblViewTapped))
        gpsLbl.isUserInteractionEnabled = true
        gpsLbl.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.bellowViewTapped))
        bellowView.addGestureRecognizer(tap2)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 800
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions
    @IBAction func expand(sender: UIButton) {
        print("somethinfg")
        postcodeView.isHidden = false
        gpsLblView.isHidden = false
        transparentBackgroundView.isHidden = false
        bellowView.isHidden = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func searchBtn(sender: UIButton) {
        print("somethinfg.....")
        searchView.isHidden = false
        transparentBackgroundView.isHidden = false
        bellowView.isHidden = false
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func cancelBtn1Pressed(sender: UIButton) {
        postcodeView.isHidden = true
        transparentBackgroundView.isHidden = true
        bellowView.isHidden = true
        gpsLblView.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func cancelBtn2Pressed(sender: UIButton) {
        searchView.isHidden = true
        transparentBackgroundView.isHidden = true
        bellowView.isHidden = true
        gpsLblView.isHidden = true
        self.navigationController?.isNavigationBarHidden = false
    }
    //MARK: - Functions
    func gpsLblViewTapped(sender: UITapGestureRecognizer){
        gpsLblView.isHidden = true
    }
    func bellowViewTapped(sender: UITapGestureRecognizer) {
        gpsLblView.isHidden = true
        transparentBackgroundView.isHidden = true
        bellowView.isHidden = true
        postcodeView.isHidden = true
        searchView.isHidden = true
    }
    
    // MARK: - Table view data source
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return (2 + Name.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 6 {
            return 30
        } else {
            return 120
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellForTitleLbl", for: indexPath as IndexPath) as! cellForTitleLbl
            cell.titleLbl.text = titleHead[indexPath.row - 1]
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellForTitleLbl", for: indexPath as IndexPath) as! cellForTitleLbl
            cell.titleLbl.text = titleHead[indexPath.row - 5]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellForItem", for: indexPath as IndexPath) as! cellForItem
            cell.imgView.image = img[indexPath.row - 2]
            cell.nameLbl.text = Name[indexPath.row - 2]
            cell.distanceLbl.text = "  2.1 Miles"
            cell.typeLbl.text = "Super Market"
            return cell
        }

    }
    var nameSelected = String()
    var imgSelected = UIImage()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameSelected = Name[indexPath.row - 2]
        imgSelected = img[indexPath.row - 2]
        performSegue(withIdentifier: "segue2Details", sender: self)
    }
    
    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue2Details" {
            if let vc = (segue.destination as? DetailsViewController ) {
                 vc.nameSegued = nameSelected
                 vc.imgReceived = imgSelected
                vc.navigationController?.navigationBar.backItem?.title = "Shop"
            }
        }
    }

}

