//
//  Passenger.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import Foundation

enum Salutation: String, RawRepresentable, Codable, CaseIterable, Identifiable {
    case Mr
    case Ms
    case Mrs
    
    var id: String { self.rawValue }
}

class Passenger: Codable, ObservableObject, Identifiable, CustomStringConvertible {
    
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
    
