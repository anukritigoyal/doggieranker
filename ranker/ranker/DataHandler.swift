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

let ref = Database.database().reference()
var allAnimals: [Animal] = []

class DataHandler {

    // Function is currently hardcoded for dogs, will have to implement cats later (based on settings)
    static func getAll(gameType: String, completion: @escaping ([UIImage]?) -> ()) {
        let catRef = ref.child("Posts/Cat")
        allAnimals = []
        var currCandidates: [Animal]?
        catRef.observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value as! [String:Any]
                // valueType should be set to whatever it's set in settings, not hardcoded
                let valueType = "Cat"
                let valueScore = value["score"] as! Int
                let toAddAnimal = Animal(id: key, type: valueType, score: valueScore)
                print("are we even getting here", key, valueType, valueScore)
                allAnimals.append(toAddAnimal)
            }
            if gameType == "Ranker" {
                currCandidates = getTwoRanker()
                completion(currCandidates)
            } else if gameType == "Guesser" {
                currCandidates = getTwoGuesser()
                completion(currCandidates)
            }
            return
            //
        })

    }
    
    // Needs to include only two images not already seen
    static func getTwoRanker() -> [Animal]? {
        let allSeen1 = UserDefaults.standard.object(forKey: "seen")
        print(allSeen1)
        var allSeen = allSeen1 as! [String]
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
        // Create a reference to the file you want to download
        if (animals == nil) {
            // something, like an alert
        }
        let url1 = "\(animals![0].id)"
        let url2 = "\(animals![1].id)"
        let islandRef = storageRef.child(url1)
        
        // Might make 2 completion handlers.
        //
        //
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
            }
        }
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

