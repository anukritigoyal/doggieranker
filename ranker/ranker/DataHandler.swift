//
//  DataHandler.swift
//  ranker
//
//  Created by Student User on 3/10/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

let ref = Database.database().reference()
let storageRef = Storage.storage().reference()
var allAnimals: [Animal] = []
var selectedAnimals: [Animal] = []
var allImages: [UIImage] = []
var score: Int = 0
var settingsAnimal = "Dog"
class DataHandler {
    
    // Function is currently hardcoded for dogs, will have to implement cats later (based on settings)
    static func getAll(gameType: String, completion: @escaping ([UIImage]?) -> ()) {
        let catRef = ref.child("Posts/\(settingsAnimal)")
        allAnimals = []
        var currCandidates: [Animal]?
        catRef.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value as! [String:Any]
                // valueType should be set to whatever it's set in settings, not hardcoded
                let valueType = settingsAnimal
                let valueScore = value["score"] as! Int
                let toAddAnimal = Animal(id: key, type: valueType, score: valueScore)
                print("are we even getting here", key, valueType, valueScore)
                allAnimals.append(toAddAnimal)
            }
            selectedAnimals = []
            if gameType == "Ranker" {
                currCandidates = getTwoRanker()
                //                completion(currCandidates)
            } else if gameType == "Guesser" {
                currCandidates = getTwoGuesser()
                //                completion(currCandidates)
            }
            getPhotos(currCandidates, completion: completion)
            //
        })
        
    }
    
    // Needs to include only two images not already seen
    static func getTwoRanker() -> [Animal]? {
        let allSeenDefaults = UserDefaults.standard.object(forKey: "seen")
        var allSeen = allSeenDefaults as! [String]
        var unseenAnimals: [Animal] = []
        for animal in allAnimals {
            if !allSeen.contains(animal.id) {
                unseenAnimals.append(animal)
            }
        }
        if unseenAnimals.count < 2 {
            print("We're returning Nil!")
            return nil
        }
        let firstRand = Int.random(in: 0..<unseenAnimals.count)
        var secondRand = Int.random(in: 0..<unseenAnimals.count)
        while secondRand == firstRand {
            secondRand = Int.random(in: 0..<unseenAnimals.count)
        }
        print(unseenAnimals[firstRand].id, unseenAnimals[secondRand].id)
        allSeen.append(unseenAnimals[firstRand].id)
        allSeen.append(unseenAnimals[secondRand].id)
        UserDefaults.standard.set(allSeen, forKey: "seen")
        
        return [unseenAnimals[firstRand], unseenAnimals[secondRand]]
        
    }
    
    //
    static func getTwoGuesser() -> [Animal]? {
        let firstRand = Int.random(in: 0..<allAnimals.count)
        var secondRand = Int.random(in: 0..<allAnimals.count)
        while secondRand == firstRand {
            secondRand = Int.random(in: 0..<allAnimals.count)
        }
        print(allAnimals[firstRand].id, allAnimals[secondRand].id)
        return [allAnimals[firstRand], allAnimals[secondRand]]
    }
    
    static func getPhotos(_ animals:[Animal]?, completion: @escaping ([UIImage]?) -> ()) {
        //        _ animals:[Animal]?, completion: @escaping ([UIImage]?) -> ()
        // Create a reference to the file you want to download
        //        if (animals == nil) {
        //            // something, like an alert
        //            return
        //        }
        let group = DispatchGroup()
        if animals == nil {
            completion(nil)
            return
        }
        print(animals![0].id, animals![1].id)
        //        let url1 = "Frank.jpg"
        //        let url2 = "Lucy.jpg"
        //        let urls: [String] = [animals![0].id, animals![1].id]
        //        let urls: [String] = [url1, url2]
        allImages = []
        for animal in animals! {
            let url = "\(animal.id).jpg"
            group.enter() // for imageManager
            let imgRef = storageRef.child(url)
            imgRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print("ERROR:", error)
                    return
                } else {
                    let image = UIImage(data: data!)
                    allImages.append(image!)
                }
                selectedAnimals.append(animal)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            completion(allImages)
        }
    }
    
    static func currSelectedAnimals() -> [Animal] {
        return selectedAnimals
    }
    
    static func getPhotos() -> [UIImage] {
        return allImages
    }
    
    static func resetScore() {
        score = 0
    }
    
    static func addScore() {
        score = score + 1
    }
    
    static func currScore() -> Int {
        return score
    }
    
    static func setAnimal(_ newAnimal: String) {
        settingsAnimal = newAnimal
    }
    
    static func getAnimal() -> String {
        return settingsAnimal
    }
    
    
    
    static func checkInitial() -> [String] {
        guard let allSeen = UserDefaults.standard.object(forKey: "seen") else {
            let startArr: [String] = []
            UserDefaults.standard.set(startArr, forKey: "seen")
            return startArr
        }
        return allSeen as! [String]
        
    }
    
}

class Animal: NSObject {
    var id: String
    var type: String
    var score: Int
    
    init(id: String, type: String, score: Int) {
        self.id = id
        self.type = type
        self.score = score
    }
}

