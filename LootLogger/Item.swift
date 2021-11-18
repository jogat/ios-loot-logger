//
//  Item.swift
//  LootLogger
//
//  Created by Josue Garza Tapia on 11/4/21.
//

import UIKit

class Item : Equatable {
    
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDolars: Int) {
        self.name = name
        self.valueInDollars = valueInDolars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.serialNumber == rhs.serialNumber
        && lhs.valueInDollars == rhs.valueInDollars
        && lhs.dateCreated == rhs.dateCreated
    }
    
    convenience init (random: Bool = false) {
        
        if (random) {
            let adjetives = ["orem ipsum dolor sit amet, consectetur Fluffy", "adipiscing elit, sed do eiusmod tempor incididun Rusty", " ut labore et dolore magna aliquaShiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            let randomAdjetive = adjetives.randomElement()!
            let randomNoun = nouns.randomElement()!
            
            let randomName = "\(randomAdjetive) \(randomNoun)"
            let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDolars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDolars: 0)
        }
        
    }
}
