//
//  AirportCity.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


struct AirportCity: Codable {
    let cityCode: String
    let cityName: String
    enum CodingKeys: CodingKey {
        case cityCode
        case cityName
    }
}
