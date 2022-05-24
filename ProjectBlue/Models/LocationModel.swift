//
//  LocationModel.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 12/05/22.
//

import Foundation

class LocationModel {
    let id: Int
    let name: String
    let level: Int?
    let type: LocationType
    
    required init(id: Int,
                  name: String,
                  level: Int?,
                  type: LocationType) {
        self.id = id
        self.name = name
        self.level = level
        self.type = type
    }
}

enum LocationType {
    case dungeon
    case maskedCarnivale
    case openWorld
    case raid
    case trial
    case hunt
}
