//
//  User.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


/// Memberships available with the airlines.
///
/// Visit some random page (``https://example.com``) for an explanation about the memberships: what they mean and what benefits do they provide.
enum Membership: String, RawRepresentable, Codable {
    case gold
    case silver
    case platinum
}



/// User describes a particular account for the airline... This is a user account and different from a `Passenger` type.
///
/// A `User` represent the unique id for customer to interact with the airline, it stores history and provide benefits and auth to the specified credentials. `Passenger` on the other hand, can refer to any pseudo-anonymous individual, booking a flight and eventually a seat with airline. A `User` recieves loyalty points and membership due to its unique interactions with the airline.
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
