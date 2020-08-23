//
//  model.swift
//  Work with Realm
//
//  Created by Steven Kirke on 22.08.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//

import Foundation

struct Cars {
    var nameModel: String
    var descriptionModel: String?
    var priceCar: String
    
    static let model = ["Cadillac", "Lexus", "KIA", "Cadillac", "Scoda", "BMW", "Hammer", "Audi"]
    
    static func getCars() -> [Cars] {
        
        var cars = [Cars]()
        
        for elem in model {
            cars.append(Cars(nameModel: elem, descriptionModel: "Escalade", priceCar: "10000$"))
        }
        return cars
    }
}
