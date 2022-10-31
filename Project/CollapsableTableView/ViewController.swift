//
//  ViewController.swift
//  CollapsableTableView
//
//  Created by kuldeep Singh on 27/10/22.
//

import UIKit

class ViewController: UIViewController {

    var productArray : [Product] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var productData = Product.init(name: "Junk Food", item: ["Burger", "Pizza", "Nuddles", ""])
        var ProductData1 = Product.init(name: "Gym Expercise", item: ["Bicep", "Chest", "Tricep" , ""])
        var ProductData2 = Product.init(name: "Teacher", item: ["History", "Math", "Science", ""])
        print("your productData 1 : \(productData.item[0])")
        productArray.append(productData)
        productArray.append(ProductData1)
        productArray.append(ProductData2)
        
        let nibCasz = UINib(nibName: "PEFinializeHeaderTableViewCell", bundle: nil)
        tableView.register(nibCasz, forCellReuseIdentifier: "PEFinializeHeaderTableViewCell")
        //PE_FinalizeCell
        let nibCas = UINib(nibName: "PE_FinalizeCell", bundle: nil)
        tableView.register(nibCas, forCellReuseIdentifier: "PE_FinalizeCell")
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if productArray[section].isOpened {
            return productArray[section].item.count
        }
        else{
            return  1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PEFinializeHeaderTableViewCell") as! PEFinializeHeaderTableViewCell
            cell.lblTitle.text = productArray[indexPath.section].name!
            
        return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PE_FinalizeCell") as! PE_FinalizeCell
            cell.lblQuestion.text = productArray[indexPath.section].item[indexPath.row - 1].itemName!
            return cell
        }
       
        
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toSet = !productArray[indexPath.section].isOpened
        productArray.forEach {
            $0.isOpened = false
        }
       productArray[indexPath.section].isOpened = toSet
        tableView.reloadData()
    }
    
}


