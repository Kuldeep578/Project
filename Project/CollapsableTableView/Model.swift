//
//  Model.swift
//  CollapsableTableView
//
//  Created by kuldeep Singh on 27/10/22.
//

import Foundation



class Product {
    
 var name : String?
 var isOpened = false
 var item = [Item]()
         init(name : String , item : [String]) {
        self.name = name
    
        let tom = item
            
        for ok in item {
            let itemOne = Item.init(itemName: ok)
            self.item.append(itemOne)
        }
    }
}


class Item {
    
    var itemName : String?
    
    init(itemName : String){
        self.itemName = itemName
    }
    
}
