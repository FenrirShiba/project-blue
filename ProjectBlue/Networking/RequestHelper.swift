//
//  RequestHelper.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 04/07/22.
//

import Foundation

struct RequestHelper: Codable {

private func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}

private func parse(jsonData: Data) {
    do {
        let decodedData = try JSONDecoder().decode(MonsterRequestModel.self,
                                                   from: jsonData)
        
        print("Title: ", decodedData.title)
        print("Description: ", decodedData.description)
        print("===================================")
    } catch {
        print("decode error")
        }
    }
}
