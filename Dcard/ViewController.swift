//
//  ViewController.swift
//  Dcard
//
//  Created by Chang Sophia on 2/4/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let urlStr = "https://dcard.tw/_api/posts".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
               let url = URL(string: urlStr!)
               
               let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                   if let data = data, let dic = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                       for bookstore in dic {
                           self.bookstores.append(bookstore["name"] as! String)
                       }
                       print(self.bookstores)
                   }
               }
                  task.resume()
               }
               override func didReceiveMemoryWarning() {
                   super.didReceiveMemoryWarning()
                   // Dispose of any resources that can be recreated.
               }

   


}

