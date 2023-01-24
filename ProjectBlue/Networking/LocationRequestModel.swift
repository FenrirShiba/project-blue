//
//  LocationRequestModel.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 05/07/22.
//

// Location.swift

import Foundation

// MARK: - Location
struct LocationRequestModel: Hashable {
    let id: Int?
    let name: String?
    let level: Int?
    let type: LocationRequestModelType?
}

// LocationType

enum LocationRequestModelType: Hashable {
    case dungeon
    case maskedCarnivale
    case openWorld
    case raid
    case rankSEliteMarkInLakeland
    case trial
    case typeOpenWorld
    case whalaqee
}
