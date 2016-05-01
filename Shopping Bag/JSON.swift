//
//  JSON.swift
//  Shopping Bag
//
//  Created by Arunjot Singh on 4/20/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import Foundation

class JSON {
    
    let manager = ProductDataSource()
    var Products:[Product] = []
    
    func add_remove() {
        //manager.removeProduct(<#T##ProductID: String##String#>)
        //manager.addProduct(<#T##ProductID: String##String#>, Size: <#T##String#>, Color: <#T##String#>)
    }
    
     func getJSON() {
        
        let productID = manager.productID
        let color = manager.color
        let size = manager.size
        
        var brandName: String = ""
        var itemName: String = ""
        var priceLabel: String = ""
        var imageUrl: String = ""
        
        for i in 0 ..< productID.count {
            
            let baseUrl = "http://api.shopstyle.com/api/v2/products/"+productID[i]+"?pid=uid3001-33215251-40"
            let url = NSURL(string: baseUrl)
            
            if let JSONData = NSData(contentsOfURL: url!) {
                let json: NSDictionary
                
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(JSONData, options: []) as! NSDictionary
                    
                    brandName = json.valueForKeyPath("brand.name")! as! String
                    itemName = json.valueForKeyPath("unbrandedName")! as! String
                    priceLabel = json.valueForKeyPath("priceLabel")! as! String
                    imageUrl = json.valueForKeyPath("image.sizes.IPhone.url")! as! String
                    let product = Product(brand: brandName, type: itemName, size: size[i], color: color[i], price: priceLabel, image: imageUrl)
                    Products.append(product)
                    
                } catch {
                    
                    print("error trying to convert data to JSON")
                }
            }
        }
        
        print(Products)
    }

}
