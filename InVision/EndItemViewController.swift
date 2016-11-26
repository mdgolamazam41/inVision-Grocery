//
//  EndItemViewController.swift
//  InVision
//
//  Created by USER on 11/24/16.
//  Copyright © 2016 Parallaxlogic Infotech. All rights reserved.
//

import UIKit

class EndItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var endItem = String()
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var img: [UIImage] = [
        UIImage(named: "89dcbc81bee5f343d40c061e1d87e7dc.png")!,
        UIImage(named: "5000289926935.png")!,
        UIImage(named: "alcohol-free-gin.png")!,
        UIImage(named: "bad8932f08d826cf78b.png")!,
        UIImage(named: "gordons-the-original-london-dry-gin-35cl-37-5-abv.png")!,
        UIImage(named: "images (1).png")!,
        UIImage(named: "images.png")!,
        UIImage(named: "images.png")!,
        UIImage(named: "images.png")!,
        UIImage(named: "bad8932f08d826cf78b.png")!
        ]
    var botleName : [String : Double] = ["Bombay Sapphire Gion 1 Litre" : 22.50, "Gordon's Special Dry London" : 50.00, "Gordon's Special Dry London Gin 70Cl" : 21, "Tesco Dry London Gin 9Cl" : 10.00, "Bombay Sapphire Gion 1 Li" : 22.50, "Tesco Dry London Gin 40Cl" : 70.0, "Gordon's Special London" : 22.50,  "Special Dry London" : 22.50, "Gordon's Special Dry Lon" : 90.50]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        isOfferAvailable = false
        
        self.navigationItem.title = endItem
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //NotificationCenter.default.addObserver(self, selector: #selector(updateCell), name:
         //   NSNotification.Name(rawValue: "increamentDecreament"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Functions
    func updateCell() {
    print("Notification sent!")
    }
    
    var count: Int = 0
    var last_index : [Int] = [10000]

    func CounterBtnTapped(sender: UIButton ) -> Int {
        if (last_index[last_index.count - 1] == sender.tag) {
            self.count += 1
        } else {
            count = 1
        }
        last_index.append(sender.tag)

            //if sender.tag ==
            print(sender.tag)
            let indexPath = IndexPath(row: sender.tag, section: 0)
            //print(indexPath)
            //sender.counterBtn.isEnabled = false
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForEndItem",for: indexPath) as! CellForEndItem
    
            cell.incrementBtn.isHidden = false
            cell.decreamentBtn.isHidden = false
        

            tableView.reloadRows(at: [indexPath], with: .automatic)
        
            return count
    }
    func Increament(sender: UIButton) {
        //var last_index : [Int] = [0]
        if (last_index[last_index.count - 1] == sender.tag) {
            self.count += 1
        } else {
            count = 1
        }
        last_index.append(sender.tag)

        //count += 1
        let indexPath = IndexPath(row: sender.tag, section: 0)
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForEndItem",for: indexPath) as! CellForEndItem
        cell.counterBtn.setTitle(String(count), for: .normal)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func decreament(sender: UIButton) {
        //var last_index : [Int] = [0]
        if (last_index[last_index.count - 1] == sender.tag) {
            self.count -= 1
        } else {
            count = 1
        }
        last_index.append(sender.tag)

        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CellForEndItem",for: indexPath) as! CellForEndItem
        //count -= 1
        cell.counterBtn.setTitle("\(count)", for: .normal)
        if (count == 0 ) {
            cell.counterBtn.layer.cornerRadius = 5
            cell.counterBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            cell.counterBtn.layer.borderColor = UIColor.white.cgColor
            cell.counterBtn.layer.backgroundColor = UIColor.blue.cgColor
            cell.counterBtn.setTitle("+", for: .normal)
            cell.counterBtn.setTitleColor(UIColor.white, for: .normal)
            
            cell.counterBtn.isHidden = false
            cell.counterBtn.isEnabled = true
            cell.incrementBtn.isHidden = true
            cell.decreamentBtn.isHidden = true
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func configureVisibility(for cell: UITableViewCell,
                             with item: UIButton) {
        item.isHidden = false
        item.isEnabled = true
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
        return (botleName.count)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 101
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    var isOfferAvailable = Bool()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForEndItem", for: indexPath as IndexPath) as! CellForEndItem

        if count == 0 {
            cell.counterBtn.isEnabled = true
            cell.counterBtn.layer.cornerRadius = 5
            cell.counterBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            cell.counterBtn.layer.borderColor = UIColor.white.cgColor
            cell.counterBtn.layer.backgroundColor = UIColor.blue.cgColor
            cell.counterBtn.setTitle("+", for: .normal)
            cell.counterBtn.setTitleColor(UIColor.white, for: .normal)
            cell.counterBtn.isHidden = false
            cell.incrementBtn.isHidden = true
            cell.decreamentBtn.isHidden = true
        } else {
            cell.counterBtn.isEnabled = false
            cell.incrementBtn.isHidden = false
            cell.decreamentBtn.isHidden = false
            cell.counterBtn.layer.cornerRadius = 5
            cell.counterBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            cell.counterBtn.layer.backgroundColor = UIColor.white.cgColor
            cell.counterBtn.layer.borderColor = UIColor.blue.cgColor
            cell.counterBtn.setTitleColor(UIColor.blue, for: .normal)
            cell.counterBtn.layer.borderWidth = 2
            cell.counterBtn.setTitle(String(self.count), for: .normal)
        }
        
        let name = Array(self.botleName.keys)[indexPath.row]
        let amount = Array(self.botleName.values)[indexPath.row]
        cell.botleImgView.image = img[indexPath.row]
        cell.botleName.text = name
        cell.amountLbl.text = "\(amount) Litre"
        cell.botleTypeLbl.text = endItem
        cell.priceLbl.text = "$ 200"
        cell.counterBtn.tag = indexPath.row
        cell.incrementBtn.tag = indexPath.row
        cell.decreamentBtn.tag = indexPath.row
        if count == 1 {
            
        }
        cell.counterBtn.addTarget(self, action: #selector(CounterBtnTapped(sender:)), for: .touchUpInside)
        cell.incrementBtn.addTarget(self, action: #selector(Increament(sender:)), for: .touchUpInside)
        cell.decreamentBtn.addTarget(self, action: #selector(decreament(sender:)), for: .touchUpInside)
        if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 8 {
            isOfferAvailable = true
            cell.offerImgView.isHidden = false
            cell.priceLbl.isHidden = true
            cell.offeredPriceLbl.isHidden = false
            cell.offeredPriceLbl.text = "$ 15.00"
            cell.realPriceLbl.isHidden = false
            cell.realPriceLbl.text = "$ 16.50"
        } else {
            isOfferAvailable = false
            cell.offerImgView.isHidden = true
            cell.priceLbl.isHidden = false
            cell.offeredPriceLbl.isHidden = true
            cell.offeredPriceLbl.text = "$ 15.00"
            cell.realPriceLbl.isHidden = true
            cell.realPriceLbl.text = "$ 16.50"
        }
        
        //configureVisibility(for: cell, with: cell.incrementBtn)
        return cell
    }
    
//    func configureCell(for cell: UITableViewCell,
//                            with tag: Int) {
//        cell.offerImgView?.isHidden = false
//        
//    }
//    var subCategorySelected = String()
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        subCategorySelected = categoryList[indexPath.row]
//        performSegue(withIdentifier: "segue2SubCategory", sender: self)
//    }
//
//    // MARK: - Segue
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //let backItem = UIBarButtonItem()
//        //backItem.title = "Shop"
//        if segue.identifier == "segue2SubCategory" {
//            if let vc = (segue.destination as? SubCategoresViewController ) {
//                vc.subCategoryName = subCategorySelected
//                vc.navigationController?.navigationBar.backItem?.title = "Shop"
//            }
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
