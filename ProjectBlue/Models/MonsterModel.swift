//
//  MonsterModel.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 12/05/22.
//

import Foundation

class MonsterModel {
    typealias LevelRange = (min: Int, max: Int)
    
    let id: Int
    let level: LevelRange
    let name: String
    let type: MonsterType
    let location: LocationModel
    
    required init(id: Int,
                  level: LevelRange,
                  name: String,
                  type: MonsterType,
                  location: LocationModel) {
        self.id = id
        self.level = level
        self.name = name
        self.type = type
        self.location = location
    }
    
    func levelToString() -> String {
        let labelDescription = "Lvl "
        if level.min == level.max {
            return "\(labelDescription) \(level.min)"
        }
        return "\(labelDescription) \(level.min)-\(level.max)"
    }
}

enum MonsterType {
    typealias MapPosition = (x: Float, y: Float)

    case normal(position: MapPosition)
    case boss
    case fate(position: MapPosition)
    case rank(level: RankLevel)
    
    func description() -> String {
        switch self {
        case .normal(let position):
            return "Normal: x\(position.x) y\(position.y)"
        case .boss:
            return "Boss"
        case .fate(let position):
            return "Fate: x\(position.x) y\(position.y)"
        case .rank(let level):
            return "Rank \(level.rawValue)"
        }
    }
}

enum RankLevel: String {
    case A, B, S
}
