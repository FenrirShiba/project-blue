// MonsterRequestModel.swift

import Foundation

// MARK: - MonsterRequestModel
struct MonsterRequestModel: Hashable {
    let imgName: String?
    let title: String?
    let number: Number?
    let rank: RankUnion?
    let type: TypeUnion?
    let minLvl: String?
    let worldMobL: String?
    let dutyLvl: String?
    let acquire: AcquireUnion?
}

// Number
enum Number: Hashable {
    case integer(Int)
    case string(String)
}

// RankUnion
enum RankUnion: Hashable {
    case enumeration(RankEnum)
    case integer(Int)
}

// RankEnum
enum RankEnum: Hashable {
    case empty
    case fluffy
    case purple
    case rank
    case tentacled
}

// TypeUnion
enum TypeUnion: Hashable {
    case string(String)
    case stringArray([String])
}
