//
//  Networks.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation

func auth(email: String, password: String) {
    
}

/// Makes the give url request, using http method defined in URLRequest. Tries to cast result to type T provided.
/// - Parameter urlRequest: URLRequest with all variables
/// - Returns: Codable conforming object as specified in the description
/// - Throws: Throws Error if not able to cast to T or request
func deploy<T: Codable>(urlRequest: URLRequest, completionHandler: @escaping (T) ->() ) throws {
    
    let session = URLSession.shared
    
    session.dataTask(with: urlRequest) { data, response, error in
        
    }.resume()
        
}


func giveTicket() -> Ticket {
    let ticks = Ticket()
    ticks.passengers = [Passenger(salutation: .Mr, firstName: "John", lastName: "Appleseed"), Passenger(salutation: .Mr, firstName: "Tim", lastName: "Cook")]
    ticks.email = "email@s1guza.net"
    ticks.journeys = [Journey(flyingClass: .firstClass,
                              flightNumber: "Some Number",
                              terminal: "String",
                              travelDate: Date.init(),
                              checkInTime: Date(),
                              departure: AirportCity(cityCode: "BLR", cityName: "Bangalore"),
                              departureTime: Date(),
                              destination: AirportCity(cityCode: "KNP", cityName: "Kanpur"),
                              arrivalTime: Date(), relayVia: nil)]
    
    return ticks
}
