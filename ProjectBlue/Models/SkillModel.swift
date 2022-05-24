//
//  SkillModel.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 30/03/22.
//

import Foundation

class SkillModel {
    typealias WhalaqueeTotem = (totem: String, condition: String)
    
    let id: Int
    let title: String
    let rank: Int
    let level: Int
    let acquisition: [MonsterModel]?
    let whalaqee: WhalaqueeTotem?
    
    var isBookmarked: Bool

    required init(id: Int,
                  title: String,
                  rank: Int,
                  level: Int,
                  acquisiion: [MonsterModel]? = nil,
                  whalaqee: WhalaqueeTotem? = nil,
                  isBookmarked: Bool = false) {
        self.id = id
        self.title = title
        self.rank = rank
        self.level = level
        self.acquisition = acquisiion
        self.whalaqee = whalaqee
        self.isBookmarked = isBookmarked
    }
}
