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
enum PaymentStatus: String, Codable {
    case pending
    case completed
}

class Ticket: Codable, Identifiable, ObservableObject {

class Ticket: Identifiable, ObservableObject, Codable {
    
    internal init(id: String = UUID().uuidString, status: String, bookingDate: Date, paymentStatus: String, qrData: Data, PNR: String, phone: TelCom? = nil, email: String? = nil, journeys: [Journey], extraServices: [String : String]) {
    internal init(id: String = UUID().uuidString) {
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
    // User Provided
    @Published var bookingDate: Date = .init(timeIntervalSinceNow: .init(86400))
    @Published var phone: TelCom = TelCom(countryCode: .init(), number: .init())
    @Published var email: String?
    @Published var passengers: [Passenger] = []

    @Published var extraServices: [String: String] = [:] // get a better format for this, seems very clumsy


    // AutoFilled
    @Published var qrData: Data? = nil
    @Published var journeys: [Journey] = []
    
    
    let qrData: Data
    var passengers: [Passenger] = []
    let PNR: String
    // Generated
    @Published var paymentStatus: PaymentStatus = .pending
    @Published var PNR: String? = nil

    var commsExist: AnyPublisher<Bool, Never> {
        
        Publishers.CombineLatest($email, $phone)
            .map { email, phone in
                return email != nil || phone.isValid
            }
            .eraseToAnyPublisher()
    }
    
    var phone: TelCom?
    var email: String?
    
    var commsExist: Bool { return phone != nil || email != nil }
    
    var journeys: [Journey]
    
    var extraServices: [String: String] // get a better format for this, seems very clumsy
}


