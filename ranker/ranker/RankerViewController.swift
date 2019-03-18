import UIKit
import Firebase
import FirebaseDatabase



class RankerViewController: UIViewController {
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        view.addSubview(firstView)
        view.addSubview(secondView)
        firstView.addSubview(firstImage)
        secondView.addSubview(secondImage)
        view.addSubview(backButton)
        setupMain()
        
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
            
        }
        
    }
    
    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.layer.masksToBounds = true

        return img
    }()
    
    let secondImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.layer.masksToBounds = true
        
        return img
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to Home", for:.normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Chalkboard SE", size:20.0)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    //    let singleTap = UITapGestureRecognizer(target: self, action: #selector(selected0))
    //    let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(selected1))
    @objc func buttonAction() {
        performSegue(withIdentifier: "rankerToHome", sender: self)
    }
    
    
    private func setupMain() {
        view.addSubview(firstView)
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0))
        
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: firstView, attribute: .bottom, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0))
        
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
        
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .leading, relatedBy: .equal, toItem: firstView, attribute: .trailing, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
        
        firstImage.heightAnchor.constraint(equalTo: firstView.heightAnchor, multiplier: 0.6).isActive = true
        firstImage.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.6).isActive = true
        firstImage.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
        firstImage.centerYAnchor.constraint(equalTo: firstView.centerYAnchor).isActive = true
        
        secondImage.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.6).isActive = true
        secondImage.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.6).isActive = true
        secondImage.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
        secondImage.centerYAnchor.constraint(equalTo: secondView.centerYAnchor).isActive = true
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(selected0))
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(selected1))
        firstImage.isUserInteractionEnabled = true
        secondImage.isUserInteractionEnabled = true
        firstImage.addGestureRecognizer(singleTap)
        secondImage.addGestureRecognizer(singleTap2)
        firstImage.image = DataHandler.getPhotos()[0]
        secondImage.image = DataHandler.getPhotos()[1]
        
        
        
        
    }
    
    @objc func selected0() {
        animalSelected(0)
    }
    
    @objc func selected1() {
        animalSelected(1)
    }
    
    
    @objc func animalSelected(_ selected:Int){
        firstImage.isUserInteractionEnabled = false
        secondImage.isUserInteractionEnabled = false
        let animals = DataHandler.currSelectedAnimals()
        let ref = Database.database().reference()
        let animalSelected = animals[selected]
        let increaseScore = animalSelected.score + 1
        ref.child("Posts/Dog/\(animalSelected.id)/score").setValue(increaseScore)
        DataHandler.getAll(gameType: "Ranker", completion: reloadComplete)
    }
    
    private func reloadComplete(_ animalImages: [UIImage]?) {
        guard let imgs =  animalImages else {
            let alert = UIAlertController(title: "Sorry", message: "You've guessed on all the animals, return to the homescreen", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Back to Homepage", style: .default, handler: {_ in self.backToHome()}))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(selected0))
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(selected1))
        firstImage.isUserInteractionEnabled = true
        firstImage.addGestureRecognizer(singleTap)
        secondImage.isUserInteractionEnabled = true
        secondImage.addGestureRecognizer(singleTap2)
        UIView.transition(with: self.firstView,
                          duration: 0.7,
                          options: UIView.AnimationOptions.transitionCrossDissolve,
                          animations: { self.firstImage.image = animalImages![0] },
                          completion: nil)
        UIView.transition(with: self.secondView,
                          duration: 0.7,
                          options: UIView.AnimationOptions.transitionCrossDissolve,
                          animations: { self.secondImage.image = animalImages![1] },
                          completion: nil)
        
    }
    
    private func backToHome() {
        performSegue(withIdentifier: "rankerToHome", sender: self)
    }
    
}
