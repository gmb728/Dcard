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
    var title: [String] = []
    var excerpt: [String] = []
    var createAt: [String] = []
    var likeCount: [String] = []

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
                        self.title.append(dcard["title"] as! String)
                    }
                    for dcard in dic {
                        self.excerpt.append(dcard["excerpt"] as! String)
                    }
                    for dcard in dic {
                        self.createAt.append(dcard["createAt"] as! String)
                    }
                    for dcard in dic {
                      self.likeCount.append(dcard["likeCount"] as! String)
                        }
                    }
                    print(self.id)
                    self.tableView.reloadData()
            
        }
    }
 }
    task.resume()
}


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailController = segue.destination as? DetailTableViewController
        if let row = tableView.indexPathForSelectedRow? .row {
            let dcard: [Any] = [id[row], title[row], excerpt[row], createAt[row], likeCount[row]]
            
            detailController?.dcard = dcard
        }
}
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let id = self.id[indexPath.row]
        let title = self.title[indexPath.row]
        cell.textLabel?.text = id
        cell.detailTextLabel?.text = title
    }

    override func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DcardCell", for: indexPath)
        
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }

    override func tableView(_tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return id.count
}

