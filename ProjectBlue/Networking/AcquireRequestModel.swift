//
//  AcquireRequestModel.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 05/07/22.
//


import Foundation

// AcquireUnion
enum AcquireUnion: Hashable {
    case acquireRequestModelArray([AcquireRequestModel])
    case string(String)
}

// MARK: - AcquireRequestModel
struct AcquireRequestModel: Hashable {
    let id: Int?
    let name: String?
    let lvlRange: [Int]?
    let type: AcquireType?
    let addInfo: [AddInfo]?
    let location: LocationRequestModel?
}

// AcquireType
enum AcquireType: Hashable {
    case boss
    case fate
    case normal
    case rank
    case whalaqee
    case whalaqeee
}

// AddInfo

enum AddInfo: Hashable {
    case double(Double)
    case string(String)
}
