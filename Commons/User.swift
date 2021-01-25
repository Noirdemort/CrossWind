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
    
    var id: String = UUID().uuidString
    
    let name: String
    let email: String
    let secureHash: String
    let membership: Membership.RawValue
    let phone: TelCom?
}
