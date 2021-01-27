//
//  User.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


enum Membership: String, RawRepresentable, Codable {
    case gold
    case silver
    case platinum
}

struct User: Codable, Identifiable, CustomStringConvertible, CustomDebugStringConvertible {
    
    var debugDescription: String { return description }
    
    var description: String {
        return """
            User Model
            
            id: \(id)
            name: \(name)
            email: \(email)
            secureHash: \(secureHash)
            membership: \(membership.rawValue)
            phone: \(String(describing: phone))
            """
    }
    
    
    var id: String = UUID().uuidString
    
    let name: String
    let email: String
    let secureHash: String
    let membership: Membership
    let phone: TelCom?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case email
        case secureHash
        case membership
        case phone
    }
}
