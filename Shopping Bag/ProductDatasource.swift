//
//  ProductDatasource.swift
//  Shopping Bag
//
//  Created by Arunjot Singh on 4/19/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import Foundation
class ProductDataSource{
    
    var productID: [String] = ["441112784", "488020366", "500205544", "479106400", "517702686"]
    var size: [String] = ["Size: S", "Size: 6", "Size: N/A", "test1", "test2"]
    var color: [String] = ["Color: Midnight Navy/Tawny/Light Crimson", "Color: Black", "Color: Kir Royale", "test1", "test 2"]
    
    func addProduct(ProductID: String, Size: String, Color: String) {
        productID.append(ProductID)
        size.append(Size)
        color.append(Color)
    }
    
    func removeProduct(ProductID: String) {
        let index = productID.indexOf(ProductID)
        productID.removeAtIndex(index!)
        size.removeAtIndex(index!)
        color.removeAtIndex(index!)
    }
    
}