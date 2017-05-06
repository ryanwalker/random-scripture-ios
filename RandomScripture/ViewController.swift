//
//  ViewController.swift
//  RandomScripture
//
//  Created by Ryan Walker on 5/6/17.
//  Copyright © 2017 Ryan Walker. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    let randomScriptures = ["random 1", "random 2", "random 3"]
    var index = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        
        self.refreshControl = refreshControl
        
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        print("refresh")
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = randomScriptures[index]
        cell.detailTextLabel?.text = "detailed message i guess"
        
        index = (index >= 2 ? 0 : index + 1)

        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

