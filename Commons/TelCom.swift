//
//  TelCom.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation
import Combine


struct TelCom: Codable, CustomStringConvertible, CustomDebugStringConvertible {
    
    var debugDescription: String {
        return description
    }
    

    var description: String {
        return """
            TelCom Model
            
            country code: \(countryCode)
            phone number: \(number)

            Is this number valid? \(isValid)
            """
    }
    
    var countryCode: String
    var number: String


    var isValid: Bool {
        return !countryCode.isEmpty && number.count == 10
    }
    
    enum CodingKeys: CodingKey {
        case countryCode
        case number
    }
}


//class TelCom: Codable, ObservableObject {
//
//    @Published var countryCode: String
//    @Published var number: String
//
//    var isValidPublisher: AnyPublisher<Bool, Never> {
//        Publishers.CombineLatest($countryCode, $number)
//            .map { countryCode, number in
//                return number.count == 10 && !countryCode.isEmpty
//            }
//            .eraseToAnyPublisher()
//    }
//
//    var isValid: Bool {
//        return !countryCode.isEmpty && number.count == 10
//    }
//
//    enum CodingKeys: CodingKey {
//        case countryCode
//        case number
//    }
//
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        countryCode = try container.decode(String.self, forKey: .countryCode)
//        number = try container.decode(String.self, forKey: .number)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(countryCode, forKey: .countryCode)
//        try container.encode(number, forKey: .number)
//    }
//
//}


