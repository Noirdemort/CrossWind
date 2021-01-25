//
//  AirportCity.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


struct AirportCity: Codable, CustomStringConvertible {
    let cityCode: String
    let cityName: String
    
    enum CodingKeys: CodingKey {
        case cityCode
        case cityName
    }
    
    var description: String {
        return """
            AirPort City

            city code: \(cityCode)
            city name: \(cityName)
            """
    }
}
