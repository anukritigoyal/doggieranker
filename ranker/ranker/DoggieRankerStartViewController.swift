//
//  DoggieRankerStartViewController.swift
//  ranker
//
//  Created by Anukriti Goyal on 10/3/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class DoggieRankerStartViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        self.start.layer.cornerRadius = 20
        
//        start.frame = CGRect(x: 160, y: 340, width: 70, height: 70)
//        start.layer.cornerRadius = 0.5 * start.bounds.size.width

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
