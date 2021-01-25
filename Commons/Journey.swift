//
//  Journey.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


enum FlyingClass: String, RawRepresentable {
    case economy
    case business
    case firstClass
}


struct Journey: Codable, Identifiable {
    
    var id: String = UUID().uuidString
    
    // flight details
    let flyingClass: FlyingClass.RawValue
    let flightNumber: String

    
    // travel details
    let terminal: String

    let travelDate: Date
    let checkInTime: Date

    let departure: AirportCity
    let departureTime: Date
    
    
    let destination: AirportCity
    let arrivalTime: Date
    
    let relayVia: String?
    
}
