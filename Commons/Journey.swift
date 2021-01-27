//
//  Journey.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


enum FlyingClass: String, RawRepresentable, Codable {
    case economy
    case business
    case firstClass
}


struct Journey: Codable, Identifiable, CustomStringConvertible, CustomDebugStringConvertible {
    
    var id: String = UUID().uuidString
    
    // flight details
    let flyingClass: FlyingClass
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
    
    enum CodingKeys: CodingKey {
        case id
        case flyingClass
        case flightNumber
        case terminal
        case travelDate
        case checkInTime
        case departure
        case departureTime
        case destination
        case arrivalTime
        case relayVia
    }
    
    var debugDescription: String { return description }
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .long
        
        return  """
            Journey Model

            id: \(id)
            
            flyingClass: \(flyingClass)
            flightNumber: \(flightNumber)
            terminal: \(terminal)
            
            travel date: \(dateFormatter.string(from: travelDate))
            check-In Time: \(dateFormatter.string(from: checkInTime))
            
            Departure City: \(departure)
            Departure time: \(dateFormatter.string(from: departureTime))

            Destination City: \(destination)
            Arrival time: \(dateFormatter.string(from: arrivalTime))

            connecting flights: \(relayVia ?? "Direct Flight (N/A)")
            """
    }
    
}


