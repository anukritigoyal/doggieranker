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

class SubmitViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let image = UIImagePickerController()
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
