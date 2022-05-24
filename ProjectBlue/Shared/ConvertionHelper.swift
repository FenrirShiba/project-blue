//
//  ConvertionHelper.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 11/05/22.
//

import Foundation

final class ConvertionHelper {
    
    public static func numberToStars(_ number: Int) -> String {
        var result = ""
        
        for _ in 0..<number {
            result += SkillTableViewCell.starCharacter
        }
        return result
    }
}
