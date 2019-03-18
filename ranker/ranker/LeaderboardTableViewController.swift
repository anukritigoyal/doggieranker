//
//  LeaderboardTableViewController.swift
//  ranker
//
//  Created by Peiyu Yi on 3/17/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

let ref = Database.database().reference()
class LeaderboardTableViewController: UITableViewController {
    var myArray = [Leaderboard]()
    
    @IBOutlet var s: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()
        self.s.reloadData()
        
        print(myArray)
    }
    
    func readData() {
        ref.child("Leaderboard").observeSingleEvent(of: .value, with: {(snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value as! [String: Any]
                let currScore = value["score"] as! Int
    
                let lb = Leaderboard(tag: key, score: currScore)
                self.myArray.append(lb)
            }
            print(self.myArray)
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myArray.count
        //return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = myArray[indexPath.row].tag
        //cell.textLabel?.text = "ABC"
        return cell
    }
}

struct Leaderboard {
    var tag: String
    var score: Int
}
