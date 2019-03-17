//
//  GuessingGameViewController.swift
//  ranker
//
//  Created by Matthew Vogt on 3/9/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

/*
 Core:
 
    First the view should load with nothing inside of it besides instructions on how to play the game.
    Maybe have something to signify that the game is loading or downloading the images
    When images are finnished loading, show the button to display the game
 
    A game will consist of two images, when one is clicked  they are either right or wrong
    ???Give them a confirm option???
        right: Tell them they are correct, option to quit / see leaderboard, next round
        wrong: Tell them they are wrong, they can see leaderboard or quit from here.
 
*/
import UIKit

class GuessingGameViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var loadingStackView: UIStackView!
    
    @IBOutlet weak var leaderboard: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHandler.getAll(gameType: "Guesser", completion: completed(_:))
    }
    
    
    private func completed(_ animalImages: [UIImage]?) {
        self.loadingStackView.isHidden = true
        self.startGameButton.isHidden = false

    }
    

    @IBAction func startGame(_ sender: UIButton) {
        performSegue(withIdentifier: "toGame", sender: self)
    }
    
    
    
}
