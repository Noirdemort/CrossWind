//
//  Bookings.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation

enum Salutation: String, RawRepresentable {
    case Mr
    case Ms
    case Mrs
}

struct Passenger: Codable {
    let salutation: Salutation.RawValue
    
    let firstName: String
    let middleName: String?
    let lastName: String?
    
    var fullName: String {
        return "\(firstName) + \(middleName ?? .init()) + \(lastName ?? .init())"
    }
}

class Ticket: Codable, Identifiable, ObservableObject {
    
    internal init(id: String = UUID().uuidString, status: String, bookingDate: Date, paymentStatus: String, qrData: Data, PNR: String, phone: TelCom? = nil, email: String? = nil, journeys: [Journey], extraServices: [String : String]) {
        self.id = id
        self.status = status
        self.bookingDate = bookingDate
        self.paymentStatus = paymentStatus
        self.qrData = qrData
        self.PNR = PNR
        self.phone = phone
        self.email = email
        self.journeys = journeys
        self.extraServices = extraServices
    }
    
    
    var id: String = UUID().uuidString
    
    // Ticket
    let status: String // replace with enums
    let bookingDate: Date
    let paymentStatus: String
    
    let qrData: Data
    var passengers: [Passenger] = []
    let PNR: String
    
    var phone: TelCom?
    var email: String?
    
    var commsExist: Bool { return phone != nil || email != nil }
    
    var journeys: [Journey]
    
    var extraServices: [String: String] // get a better format for this, seems very clumsy
}


