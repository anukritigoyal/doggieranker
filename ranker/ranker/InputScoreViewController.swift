//
//  InputScore.swift
//  ranker
//
//  Created by Peiyu Yi on 3/12/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class InputScoreViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var loadingView: UIStackView!
    
    @IBAction func submit(_ sender: UIButton) {
        if usernameIsValid() {
            sender.isEnabled = false
            loadingView.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
                let Leaderboard = self.storyboard?.instantiateViewController(withIdentifier: "Leaderboard") as! LeaderboardViewController
                self.present(Leaderboard, animated: true, completion: nil)
            }
        } else {
            // give alert or whatever... Not sure what firebase would allow for usernames...'
            print(username.text, " is an invalid username")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(self.score)"
    }
    
    func usernameIsValid() -> Bool {
        return username.text != ""
}


