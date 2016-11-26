//
//  DetailsViewController.swift
//  InVision
//
//  Created by USER on 11/23/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var imgReceived = UIImage()
    var nameSegued = String()
    @IBOutlet weak var tableView: UITableView!
    var categories: [String] = ["Special Offers", "Food Cupboard", "Beverage", "Fresh Choice", "Frozen", "Health and Beauty", "Household", "Organic Grocery", "Frozen"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        //imgReceived = img
        print(imgReceived)
        print(nameSegued)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    @IBAction func back2Shop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return (2 + categories.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 230
        } else {
            return 62
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CellForShopTitle
            cell.nameLbl.text = nameSegued
            cell.logoImgView.image = imgReceived
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath as IndexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath as IndexPath) as! CellForDetails
            if indexPath.row == 2 {
                cell.caregoriesLbl.textColor = UIColor.red
            }
            cell.caregoriesLbl.text = categories[indexPath.row - 2]
            return cell
        }
        
    }
    
    var categorySelected = String()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categorySelected = categories[indexPath.row - 2]
        performSegue(withIdentifier: "segue2Category", sender: self)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let backItem = UIBarButtonItem()
        //backItem.title = "Shop"
        if segue.identifier == "segue2Category" {
            if let vc = (segue.destination as? CategoresViewController ) {
                vc.categoryName = categorySelected
                vc.navigationController?.navigationBar.backItem?.title = "Shop"
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
