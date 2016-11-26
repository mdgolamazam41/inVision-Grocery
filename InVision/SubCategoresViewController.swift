//
//  SubCategoresViewController.swift
//  InVision
//
//  Created by USER on 11/24/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class SubCategoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var categoryName = String()
    var subCategoryType = String()
    var subCategoryList: [String : Int] = ["Champagne" : 22, "Dessert Wine" : 12, "Red Wine": 9, "Rose Wine": 47, "White Wine" : 32, "Sparkling Wine" : 10, "Gin" : 26, "Bear" : 55, "Cider" : 17, "Whisky" : 18]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var subCategoryTypeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = categoryName
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        print(subCategoryType)
        subCategoryTypeLbl.text = subCategoryType
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func goBack(){
        self.navigationController?.popViewController(animated: true);
    }
    
    // MARK: - Table view data source
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return (subCategoryList.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 69
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForSubCategory", for: indexPath as IndexPath) as! CellForSubCategory
        let key = Array(self.subCategoryList.keys)[indexPath.row]
        let values = Array(self.subCategoryList.values)[indexPath.row]
        cell.subCategoryListLbl.text = key
        cell.numberOfItems.layer.masksToBounds = true
        cell.numberOfItems.layer.cornerRadius = 8
        cell.numberOfItems.text = "\(values) items"
        return cell
    }
    
    var itemSelected = String()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(self.subCategoryList.keys)[indexPath.row]
        itemSelected = key
        performSegue(withIdentifier: "segue2EndItems", sender: self)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "segue2EndItems" {
            if let vc = (segue.destination as? EndItemViewController ) {
                vc.endItem = itemSelected
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
