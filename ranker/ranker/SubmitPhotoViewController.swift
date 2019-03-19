//
//  SubmitPhotoViewController.swift
//  ranker
//
//  Created by Gabe Bizar on 3/18/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class SubmitPhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var animalType: String?
    let image = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        setupSegment()

        // Do any additional setup after loading the view.
    }
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            inputImage.image = image
            print("I'm here")
        }
        else {
          print("ooops on the photo")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func submitPhoto(_ sender: Any) {
        let type: String = animalType!
        let score : Int = 0
        let post: [String: AnyObject] = ["score":score as AnyObject]
        let ref = Database.database().reference()
        let val : String = ref.child("Posts/\(type)").childByAutoId().key!
        ref.child("Posts/\(type)").child(val).setValue(post)
        let storageRef = Storage.storage().reference()
        let imgString = "\(val).jpg"
        let imageRef = storageRef.child(imgString)
        if let uploadData = inputImage.image!.pngData() {
            imageRef.putData(uploadData,metadata:nil, completion: nil)
        }
        performSegue(withIdentifier: "submitPhotoToHome", sender: self)
    }
   
    @IBOutlet weak var segmentCont: UISegmentedControl!
    @IBAction func segmentChange(_ sender: Any) {
    }
    @IBOutlet weak var inputImage: UIImageView!
    
    private func setupSegment(){
        let selected = segmentCont.selectedSegmentIndex
        segmentCont.selectedSegmentIndex = 0
        animalType = segmentCont.titleForSegment(at: selected)
        print(animalType!)
        submitBtn.setTitleColor(.white, for: .normal)
        importBtn.setTitleColor(.white, for: .normal)
        submitBtn.layer.cornerRadius = 35
        importBtn.layer.cornerRadius = 35
        submitBtn.layer.masksToBounds = true
        importBtn.layer.masksToBounds = true
        importBtn.backgroundColor = UIColor.darkGray
        submitBtn.backgroundColor = UIColor(red: 0.13, green: 0.54, blue: 0.13, alpha: 1)
        submitBtn.layer.borderColor = UIColor.white.cgColor
        submitBtn.layer.borderWidth = 2
        importBtn.layer.borderColor = UIColor.white.cgColor
        importBtn.layer.borderWidth = 2


        
    }
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var importBtn: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
