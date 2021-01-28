//
//  Passenger.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import Foundation

/// Describes salutations used by individuals.
enum Salutation: String, RawRepresentable, Codable, CaseIterable, Identifiable {
    case Mr
    case Ms
    case Mrs
    
    var id: String { self.rawValue }
}

/// Describes a passenger info for a journey
class Passenger: Codable, ObservableObject, Identifiable, CustomStringConvertible, Hashable, CustomDebugStringConvertible {
    
    internal init(id: String = UUID().uuidString) {
        self.id = id
    }
    
    convenience init(salutation: Salutation, firstName: String, middleName: String? = nil, lastName: String?) {
        self.init()
        self.salutation = salutation
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
    
    var id: String = UUID().uuidString
    
    @Published var salutation: Salutation = .Mr
    @Published var firstName: String = ""
    @Published var middleName: String?
    @Published var lastName: String?
    
    var fullName: String {
        return "\(salutation). \(firstName) \(middleName ?? .init()) \(lastName ?? .init())".trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // MARK:- Equatable
    static func == (lhs: Passenger, rhs: Passenger) -> Bool {
        return lhs.id == rhs.id &&
            lhs.firstName == rhs.firstName &&
            lhs.middleName == rhs.middleName &&
            lhs.lastName == rhs.lastName
    }
    
    
    // MARK:- Hashable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(salutation)
        hasher.combine(firstName)
        hasher.combine(middleName)
        hasher.combine(lastName)
    }
    
    // MARK:- Codable
    enum CodingKeys: CodingKey {
        case salutation
        case firstName
        case middleName
        case lastName
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        salutation = try container.decode(Salutation.self, forKey: .salutation)
        firstName = try container.decode(String.self, forKey: .firstName)
        middleName = try container.decode(String.self, forKey: .middleName)
        lastName = try container.decode(String.self, forKey: .lastName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(salutation, forKey: .salutation)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(middleName, forKey: .middleName)
        try container.encode(lastName, forKey: .lastName)
    }
    
    
    // MARK:- CustomStringConvertible
    var description: String {
        return """
            Passenger

            Name: \(salutation). \(firstName)  \(middleName ?? .init()) \(lastName ?? .init())
            """
    }
    
    
    // MARK:- CustomDebugStringConvertible
    var debugDescription: String {
        return """
            Passenger Model
            ID: \(id)
            Salutation: \(salutation)
            First Name: \(firstName)
            Middle Name: \(middleName ?? "N/A")
            Last Name: \(lastName ?? "N/A")
            """
    }
}
