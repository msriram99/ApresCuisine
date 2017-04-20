//
//  Dish.swift
//  ApresCuisine
//
//  Created by Himaja Motheram on 4/11/17.
//  Copyright © 2017 Sriram Motheram. All rights reserved.
//

import Foundation

import Parse


class Dish: PFObject, PFSubclassing {
    
    
      @NSManaged var  name          :String
      @NSManaged var  dateeaten  :Date?
      @NSManaged var  rating          :Int
      @NSManaged var  review  :String
    
    
    convenience init(name: String, date: Date, rate: Int, review: String) {
        
        self.init()
        self.name = name
        self.dateeaten = date
        self.rating = rate
        self.review = review
        
    }
    
    static func parseClassName() -> String {
        return "Dish"
    }

    
}
