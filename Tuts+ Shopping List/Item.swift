//
//  Item.swift
//  Tuts+ Shopping List
//
//  Created by Yohannes Wijaya on 2/11/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    // MARK: - Stored Properties
    
    var uuid: String = NSUUID().UUIDString
    var name: String = ""
    var price: Float = 0.0
    var inShoppingList = false
    
    // MARK: - NSCoding Protocol Methods
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.uuid, forKey: "uuid")
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.price, forKey: "price")
        aCoder.encodeObject(self.inShoppingList, forKey: "inShoppingList")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        guard let validUuid = aDecoder.decodeObjectForKey("uuid") as? String else { return }
        self.uuid = validUuid
        
        guard let validName = aDecoder.decodeObjectForKey("name") as? String else { return }
        self.name = validName
        
        self.price = aDecoder.decodeFloatForKey("price")
        self.inShoppingList = aDecoder.decodeBoolForKey("inShoppingList")
    }
    
    // MARK: - Initializers
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}

