//
//  JourneyView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI


/// Shows journey details for the `Journey` model
///
/// Source of truth: BookingView.ticket.journey
/// Interaction Index: 4
struct JourneyView: View {
    
    var journey: Journey
    
    var body: some View {
        VStack {
            Text(String(describing: journey))
                .multilineTextAlignment(.leading)
                .cornerRadius(10)
                .accentColor(.red)
                .clipped()
                .fixedSize()
        }
    }
    
}

struct JourneyView_Previews: PreviewProvider {
    @State static var journey = Journey(flyingClass: .firstClass,
                                        flightNumber: "Some Number",
                                        terminal: "String",
                                        travelDate: Date.init(),
                                        checkInTime: Date(),
                                        departure: AirportCity(cityCode: "BLR", cityName: "Bangalore"),
                                        departureTime: Date(),
                                        destination: AirportCity(cityCode: "KNP", cityName: "Kanpur"),
                                        arrivalTime: Date(), relayVia: nil)
    static var previews: some View {
        JourneyView(journey: journey)
    }
}
