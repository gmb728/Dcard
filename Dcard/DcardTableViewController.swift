//
//  DcardTableViewController.swift
//  Dcard
//
//  Created by Chang Sophia on 2/4/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import UIKit

class DcardTableViewController: UITableViewController {
    var id: [String] = []
    var excerpt: [String] = []
    var createAt: [String] = []
    var likeCount: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr = "https://www.dcard.tw/_api/posts".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, respose, error) in
            if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
               
                DispatchQueue.main.async{
                    
                    for dcard in dic {
                        self.id.append(dcard["id"] as! String)
                    }
                    
                    for dcard in dic {
                        self.excerpt.append(dcard["excerpt"] as! String)
                    }
                    for dcard in dic {
                        self.createAt.append(dcard["createAt"] as! String)
                    }
                    for dcard in dic {
                    self.likeCount.append(dcard["likeCount"] as! Int)
                        }
                    }
                   
                    self.tableView.reloadData()
            
        }
    }
         task.resume()
 }
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailController = segue.destination as? DetailTableViewController
        if let row = tableView.indexPathForSelectedRow? .row {
            let dcard: [Any] = [id[row], excerpt[row], createAt[row], likeCount[row]]
            
            detailController?.dcard = dcard
        }
}
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let id = self.id[indexPath.row]
        let excerpt = self.excerpt[indexPath.row]
        cell.textLabel?.text = id
        cell.detailTextLabel?.text = excerpt
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DcardCell", for: indexPath)
            
            configure(cell: cell, forItemAt: indexPath)
            return cell
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
            return id.count
    }
    }
