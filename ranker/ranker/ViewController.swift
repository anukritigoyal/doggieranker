//
//  ViewController.swift
//  ranker
//
//  Created by Ju An Oh on 3/9/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ranker: UIButton!
    @IBOutlet weak var game: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let emptyStringArr: [String] = []
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        
        
//        UserDefaults.setValue(emptyStringArr, forKey: "seen")
        
//        UserDefaults.standard.object(forKey: "seen")
        DataHandler.checkInitial()
        
    }


}

