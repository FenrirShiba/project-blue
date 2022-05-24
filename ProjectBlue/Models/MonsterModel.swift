//
//  MonsterModel.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 12/05/22.
//

import Foundation

class MonsterModel {
    typealias LevelRange = (min: Int, max: Int)
    typealias MapPosition = (x: Float, y: Float)
    
    let id: Int
    let level: LevelRange
    let positon: MapPosition?
    let name: String
    let rank: String?
    let location: LocationModel
    
    required init(id: Int,
                  level: LevelRange,
                  positon: MapPosition? = nil,
                  name: String,
                  rank: String? = nil,
                  location: LocationModel) {
        self.id = id
        self.level = level
        self.positon = positon
        self.name = name
        self.rank = rank
        self.location = location
    }
}
