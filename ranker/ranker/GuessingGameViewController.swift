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
        DataHandler.getAll(gameType: "Guesser", completion: complete1(_:))
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(firstDogSelected))
        firstDog.isUserInteractionEnabled = true
        firstDog.addGestureRecognizer(singleTap)
        let singleTapDog2 = UITapGestureRecognizer(target: self, action: #selector(secondDogSelected))
        secondDog.isUserInteractionEnabled = true
        secondDog.addGestureRecognizer(singleTapDog2)
        
    }

    
    private func complete1(_ lol: [Animal]?) {
        self.loadingStackView.isHidden = true
        self.startGameButton.isHidden = false
        
        print(lol![0].id, lol![1].id)
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
        firstDog.isUserInteractionEnabled = false
        secondDog.isUserInteractionEnabled = false
        if dog == 1 {
            self.correctGuesses += 1
            self.scoreLabel.text = "Score: \(self.correctGuesses)"
            self.correctGuessStack.isHidden = false
        } else {
            //Incorrect rn...
//            let InputScoreView = self.storyboard?.instantiateViewController(withIdentifier: "InputScore") as! InputScoreViewController
//            InputScoreView.score = self.correctGuesses
//            self.present(InputScoreView, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func nextPair(_ sender: UIButton) {
//        self.correctGuessStack.isHidden = true
//        firstDog.isUserInteractionEnabled = true
//        secondDog.isUserInteractionEnabled = true

    }
}
