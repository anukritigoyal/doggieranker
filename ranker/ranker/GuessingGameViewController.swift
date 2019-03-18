import UIKit

class GuessingGameViewController: UIViewController {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var loadingStackView: UIStackView!
    
    @IBOutlet weak var leaderboard: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        backButton.setTitle("Back to Home", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        startGameButton.setTitleColor(.white, for: .normal)
        startGameButton.isHidden = true
        startGameButton.isUserInteractionEnabled = false
        leaderboard.setTitleColor(.white, for: .normal)
        DataHandler.getAll(gameType: "Guesser", completion: completed(_:))
    }
    
    
    private func completed(_ animalImages: [UIImage]?) {
        self.loadingStackView.isHidden = true
        self.startGameButton.isHidden = false
        startGameButton.isUserInteractionEnabled = true
        
        
    }
    
    
    @IBAction func startGame(_ sender: UIButton) {
        DataHandler.resetScore()
        performSegue(withIdentifier: "toGame", sender: self)
    }
    
    @IBAction func backButtonTouch(_ sender: Any) {
        performSegue(withIdentifier: "ggBackToHome", sender: self)
    }
    
    
}
