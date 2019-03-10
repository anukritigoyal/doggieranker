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
    
    @IBOutlet weak var imageStackView: UIStackView!
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var loadingStackView: UIStackView!
    
    @IBOutlet weak var leaderboard: UIButton!
    
    @IBOutlet weak var firstDog: UIImageView!
    @IBOutlet weak var secondDog: UIImageView!
    @IBOutlet weak var correctGuessStack: UIStackView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var correctGuesses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(firstDogSelected))
        firstDog.isUserInteractionEnabled = true
        firstDog.addGestureRecognizer(singleTap)
        let singleTapDog2 = UITapGestureRecognizer(target: self, action: #selector(secondDogSelected))
        secondDog.isUserInteractionEnabled = true
        secondDog.addGestureRecognizer(singleTapDog2)
        
        // fetch images... This currently is mimicing the delay that the fetch would take
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
            self.loadingStackView.isHidden = true
            
            self.startGameButton.isHidden = false
        }
        
    }
    

    @IBAction func startGame(_ sender: UIButton) {
        self.startGameButton.isHidden = true
        self.gameTitle.isHidden = true
        self.gameDesc.isHidden = true
        self.leaderboard.isHidden = true
        self.imageStackView.isHidden = false
    }
    
    
    @objc func firstDogSelected() {
        dogSelected(dog: 1)
    }
    
    @objc func secondDogSelected() {
        dogSelected(dog: 2)
    }
    
    // Displays the step after a picture is selected
    //   if user is correct: display their new score and ask them to go to the next page.
    //   else: take them to the next page or give them the option to go to the leaderboard?
    //
    // dog represents the picture number(1 or 2) that the user selected
    func dogSelected(dog: Int) {
        if dog == 1 {
            self.correctGuesses += 1
            self.scoreLabel.text = "Score: \(self.correctGuesses)"
            self.correctGuessStack.isHidden = false
        } else {
            
        }
    }
    
    @IBAction func nextPair(_ sender: UIButton) {
        self.correctGuessStack.isHidden = true
        //
    }
}
