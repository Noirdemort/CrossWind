//
//  JourneyView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI

struct JourneyView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
        JourneyView()
        JourneyView(journey: journey)
    }
}
