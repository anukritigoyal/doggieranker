//
//  SubmitViewController.swift
//  ranker
//
//  Created by Ju An Oh on 3/9/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage


class SubmitViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let image = UIImagePickerController()
    
    @IBOutlet weak var dogorcat: UISegmentedControl!

    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
            //After it is complete
        }
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImageView.image = image
            print("I'm Here")
        } else {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func post() {        let type : String = "dog"
        let score : Int = 0
        let post : [String : AnyObject] = ["type": type as AnyObject, "score":score as AnyObject]
        let databaseRef = Database.database().reference()
        let value : String = databaseRef.child("Posts").childByAutoId().key!
        databaseRef.child("Posts").child(value).setValue(post)
        let storageRef = Storage.storage().reference()
        let imageString = "\(value).jpg"
        let imageRef = storageRef.child(imageString)
        if let uploadData = myImageView.image!.pngData() {
            imageRef.putData(uploadData, metadata: nil, completion: nil)
        }

        
        print(value, post)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(dogorcat.titleForSegment)
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
