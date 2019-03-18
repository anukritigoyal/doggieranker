//
//  LeaderboardTableViewController.swift
//  ranker
//
//  Created by Gabe Bizar on 3/18/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class LeaderboardTableViewController: UITableViewController {
    var ldArr = [Leaderboard]()
    var imageNames: [String] = ["gold", "silver", "bronze", "award", "other"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)

        let back = UIButton()
        back.setTitle("Back to Home", for: .normal)
        back.isUserInteractionEnabled = true
        back.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20)
        back.titleLabel?.textColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(backToHome))
        back.addGestureRecognizer(tap)
        let backItem = UIBarButtonItem(customView: back)
        navigationItem.leftBarButtonItem = backItem
        readData()

    }
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet var tbView: UITableView!
    
    
    
    private func readData() {
        ref.child("Leaderboard").observeSingleEvent(of: .value, with: {(snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                print(key)
                let value = snap.value as! [String: Any]
                let currScore = value["score"] as! Int
                let lb = Leaderboard(tag: key, score:currScore)
                self.ldArr.append(lb)
            }
            self.ldArr.sort{ $0.score > $1.score}
            self.tbView.reloadData()

        })
        
    }
    
    @objc private func backToHome() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        performSegue(withIdentifier: "leaderboardToHome", sender: self )
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ldArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ldArr[indexPath.row].tag
        cell.detailTextLabel?.text = "Highscore: \(ldArr[indexPath.row].score)"
        cell.detailTextLabel?.font = UIFont(name: "Chalkboard SE", size: 15)
        cell.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        cell.textLabel?.font = UIFont(name: "Chalkboard SE", size: 25)
        if indexPath.row < 3 {
            cell.imageView?.image = UIImage(named: imageNames[indexPath.row])
        } else if indexPath.row >= 3 && indexPath.row < 5 {
            cell.imageView?.image = UIImage(named: imageNames[3])
        } else {
            cell.imageView?.image = UIImage(named: imageNames[4])
        }
        return cell
    }
}

struct Leaderboard {
    var tag: String
    var score: Int
}
