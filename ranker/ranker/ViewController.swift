//
//  ViewController.swift
//  ranker
//
//  Created by Ju An Oh on 3/9/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var doggieRankStack: UIStackView!
    @IBOutlet weak var ggStack: UIStackView!
    @IBOutlet weak var submitStack: UIStackView!
    
    @IBOutlet weak var settingsStack: UIStackView!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let emptyStringArr: [String] = []
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        let doggieRankerTap = UITapGestureRecognizer(target: self, action: #selector(self.showDoggieRanker))
        let guessingGameTap = UITapGestureRecognizer(target: self, action: #selector(self.showGuessingGame))
        let submitButtonTap = UITapGestureRecognizer(target: self, action: #selector(self.showSubmitPhoto))
        let settingsTap = UITapGestureRecognizer(target: self, action: #selector(self.showSettings))
        doggieRankStack.addGestureRecognizer(doggieRankerTap)
        ggStack.addGestureRecognizer(guessingGameTap)
        submitStack.addGestureRecognizer(submitButtonTap)
        
        settingsStack.addGestureRecognizer(settingsTap)
        
        settingsStack.isUserInteractionEnabled = true
        doggieRankStack.isUserInteractionEnabled = true
        ggStack.isUserInteractionEnabled = true
        submitStack.isUserInteractionEnabled = true
//        settingsButton.trailingAnchor.constraint(equalTo: settingsButton.parent, constant: <#T##CGFloat#>)
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        
        
//        UserDefaults.setValue(emptyStringArr, forKey: "seen")
        
//        UserDefaults.standard.object(forKey: "seen")
        DataHandler.checkInitial()
        
    }
    
    @IBAction func doggieRankButton(_ sender: UIButton) {
        showDoggieRanker()
    }
    
    @IBAction func ggbutton(_ sender: UIButton) {
        showGuessingGame()
    }
    
    @IBAction func submitbutton(_ sender: Any) {
        showSubmitPhoto()
    }
    
    @objc func showDoggieRanker() {
        performSegue(withIdentifier: "homeToRanker", sender: self)
    }
    
    @objc func showGuessingGame() {
        performSegue(withIdentifier: "homeToGG", sender: self)
    }
    
    @objc func showSubmitPhoto() {
        performSegue(withIdentifier: "homeToSubmit", sender: self)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "homeToSettings", sender: self)
    }
    

}

