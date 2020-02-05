//
//  DetailTableViewConroller.swift
//  Dcard
//
//  Created by Chang Sophia on 2/4/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var dcard: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
         
  
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dcard.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)

         configure(cell: cell, forItemAt: indexPath)
    
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let title = ["id", "title", "excerpt", "createAt", "likeCount"]
        
        let detail = dcard[indexPath.row]
        cell.textLabel?.text = title[indexPath.row]
        cell.detailTextLabel?.text = detail as? String
    }
    
}
