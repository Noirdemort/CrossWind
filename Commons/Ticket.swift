//
//  Bookings.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation
import Combine


enum PaymentStatus: String, Codable {
    case pending
    case completed
}


class Ticket: Identifiable, ObservableObject, Codable {
    
    internal init(id: String = UUID().uuidString) {
        self.id = id
    }
    
    
    var id: String = UUID().uuidString
    
    // User Provided
    @Published var bookingDate: Date = .init(timeIntervalSinceNow: .init(86400))
    @Published var phone: TelCom = TelCom(countryCode: .init(), number: .init())
    @Published var email: String?
    @Published var passengers: [Passenger] = []

    @Published var extraServices: [String: String] = [:] // get a better format for this, seems very clumsy


    // AutoFilled
    @Published var qrData: Data? = nil
    @Published var journeys: [Journey] = []
    
    
    // Generated
    @Published var paymentStatus: PaymentStatus = .pending
    @Published var PNR: String? = nil

    var commsExist: Bool {
        return email != nil || phone.isValid
    }
    
    // Codable
    
    enum CodingKeys: CodingKey {
        case id
        case bookingDate
        case phone
        case email
        case passengers
        case extraServices
        
        case qrData
        case journeys
        
        case paymentStatus
        case PNR
    
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        bookingDate = try container.decode(Date.self, forKey: .bookingDate)
        phone = try container.decode(TelCom.self, forKey: .phone)
        email = try container.decode(String.self, forKey: .email)
        passengers = try container.decode([Passenger].self, forKey: .passengers)
        extraServices = try container.decode([String:String].self, forKey: .extraServices)
        
        qrData = try container.decode(Data.self, forKey: .qrData)
        journeys = try container.decode([Journey].self, forKey: .journeys)
        
        paymentStatus = try container.decode(PaymentStatus.self, forKey: .paymentStatus)
        PNR = try container.decode(String.self, forKey: .PNR)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(bookingDate, forKey: .bookingDate)
        try container.encode(phone, forKey: .phone)
        try container.encode(email, forKey: .email)
        try container.encode(passengers, forKey: .passengers)
        try container.encode(extraServices, forKey: .extraServices)
        
        try container.encode(qrData, forKey: .qrData)
        try container.encode(journeys, forKey: .journeys)
        
        try container.encode(paymentStatus, forKey: .paymentStatus)
        try container.encode(PNR, forKey: .PNR)
    }
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .long
        
        return """
            Ticket Model

            id: \(id)
            Booking Date: \(dateFormatter.string(from: bookingDate))
            Phone: \(phone)
            email: \(email ?? "N/A")
            passengers: \(passengers.reduce(""){ String(describing: $0) + "\n\n" + String(describing: $1) } )
            
            extra services: \(extraServices.values.reduce("") {$0 + ",\n" + $1})
            
            QR Code: \(String(describing: Data(base64Encoded: qrData ?? Data.init())))

            Journeys: \(journeys.reduce(""){ String(describing: $0) + "\n\n" + String(describing: $1) } )

            payment: \(paymentStatus)
            PNR: \(PNR ?? "N/A")
            
            """
    }
    
    func commit(){
        print("Printing Data from object...")
        print(description)
        print("Exporting model...")
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .deferredToData
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let encodedData = try? encoder.encode(self)
        if let data = encodedData {
            print(String(data: data, encoding: .utf8) ?? "Failed to Cast Ticket into JSON Object")
        }
    }
}


