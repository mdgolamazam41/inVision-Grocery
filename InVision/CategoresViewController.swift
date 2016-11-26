//
//  CategoresViewController.swift
//  InVision
//
//  Created by USER on 11/23/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class CategoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    var categoryName = String()
    var categoryList : [String] = ["Juice/ Water/ Soda", "Energy Drink", "Instant Power", "Alcoholic Drinks", "Iced Tea", "Organic Beverage", "Mirinda", "Coca Cola"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(categoryName)
        self.navigationItem.title = categoryName
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
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
        return (categoryList.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return 72
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForCategoryList", for: indexPath as IndexPath) as! CellForCategoryList
            cell.listItemLbl.text = categoryList[indexPath.row]
            return cell
    }
    
    var subCategorySelected = String()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subCategorySelected = categoryList[indexPath.row]
        performSegue(withIdentifier: "segue2SubCategory", sender: self)
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "segue2SubCategory" {
            if let vc = (segue.destination as? SubCategoresViewController ) {
                vc.categoryName = categoryName
                vc.subCategoryType = subCategorySelected
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
