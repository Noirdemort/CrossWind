//
//  CheckIn.swift
//  CrossWind
//
//  Created by Noirdemort on 22/01/21.
//

import Foundation


struct BoardingPass: Codable {
    var id: String = UUID().uuidString
    
    let journey: Journey
    
    // Personally Identifiable Information (PII)
    let qrData: Data
    let salutation: String
    let name: String
    let pnr: String
   
    // Flight Details
    let gate: String?
    
    // Travel Details
    let boardingTime: Date
    let seat: String
    
    // random info
    var sec: String?
    var weights: String?
    var etNumber: Int?
    
}
