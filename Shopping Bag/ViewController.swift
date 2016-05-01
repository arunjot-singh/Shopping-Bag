//
//  ViewController.swift
//  Shopping Bag
//
//  Created by Arunjot Singh on 4/6/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let jsonManager = JSON()
    let productManager = ProductDataSource()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
  

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return jsonManager.Products.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell") as? MyCustomTableViewCell!
         let products = jsonManager.Products[indexPath.section]

        cell!.brandName.text = products.brand
        cell!.itemType.text = products.type
        cell!.itemSize.text = products.size
        cell!.itemColor.text = products.color
        cell!.itemPrize.text = products.price
        
        let imageUrl = products.image
        let URL = NSURL(string: imageUrl)
        let data = NSData(contentsOfURL:URL!)
        if data != nil {
        cell!.itemImage.image = UIImage(data:data!)
        }
        
        cell!.close.tag = indexPath.section
        cell!.close.addTarget(self, action: #selector(ViewController.deleteCell(_:)), forControlEvents: .TouchUpInside)
        
        return cell!
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        jsonManager.add_remove()
        jsonManager.getJSON()
        getTotal()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func deleteCell(sender: UIButton) {
        
        jsonManager.Products.removeAtIndex(sender.tag)
        print(jsonManager.Products.count)
        getTotal()
        tableView.reloadData()
        
        
    }
    
    func getTotal() {
        var Price = 0.0
        if jsonManager.Products.count == 0 {
            priceLabel.text = ": $0.0"
        } else {
            for i in 0 ..< jsonManager.Products.count {
                var price = jsonManager.Products[i].price
                price = price.stringByReplacingOccurrencesOfString("$", withString: "")
                Price = Price + Double(price)!
                priceLabel.text = ": $"+"\(Price)"
            }
            
        }
    }
   
    
}




