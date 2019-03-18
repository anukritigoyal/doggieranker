//
//  DoggieRankerStartViewController.swift
//  ranker
//
//  Created by Anukriti Goyal on 10/3/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class DoggieRankerStartViewController: UIViewController {
    
    @IBOutlet weak var start: UIButton!
    @IBAction func touchStartButton(_ sender: Any) {
        performSegue(withIdentifier: "toRanker" sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start.backgroundColor = UIColor.darkGray
        start.setTitle("Loading...", for: .normal)
        DataHandler.getAll(gameType: "Ranker", completion: complete)
    }
    
    private func gi

}
