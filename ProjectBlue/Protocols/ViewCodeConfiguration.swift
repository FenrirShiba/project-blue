//
//  ViewCodeConfiguration.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 03/05/22.
//

protocol ViewCodeConfiguration {
    func addHierarchy()
    func setConstraints()
    func additionalProperties()
}

extension ViewCodeConfiguration {
    
    func additionalProperties() {
        // Intetionally not implemented
    }
    
    func render() {
        addHierarchy()
        setConstraints()
        additionalProperties()
    }
}
