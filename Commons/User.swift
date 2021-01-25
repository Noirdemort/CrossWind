//
//  User.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


enum Membership: String, RawRepresentable {
enum Membership: String, RawRepresentable, Codable {
    case gold
    case silver
    case platinum
}

struct User: Codable, Identifiable {
struct User: Codable, Identifiable, CustomStringConvertible {
    
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
    let membership: Membership.RawValue
    let phone: TelCom?
}
