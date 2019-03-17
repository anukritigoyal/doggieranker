//
//  SubmitViewController.swift
//  ranker
//
//  Created by Gabe Bizar on 3/17/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


class SubmitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)

        validTag.isHidden = true
    }
    @IBOutlet weak var validTag: UILabel!
    @IBOutlet weak var textInput: UITextField!
    @IBAction func backButtonTouch(_ sender: Any) {
        performSegue(withIdentifier: "toHome", sender: self)
    }
    @IBAction func submitButtonTouch(_ sender: Any) {
        guard let txt = textInput.text else {
            validTag.isHidden = false
            return
        }
        if txt.count != 3 {
            validTag.isHidden = false
            return
        }
        let ref = Database.database().reference()
        let ldrBrd = ref.child("Leaderboard").child(txt)
        ldrBrd.setValue(["score": DataHandler.currScore()])
        viewLeaderboard()
        

        
        
        
        // ALL THE FIREBASE STUFF
    }
    @IBAction func leadboardButtonTouch(_ sender: Any) {
        viewLeaderboard()
        
    }
    
    private func viewLeaderboard() {
        performSegue(withIdentifier: "toLeaderboard", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
