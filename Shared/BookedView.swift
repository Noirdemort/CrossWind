//
//  SwiftUIView.swift
//  CrossWind
//
//  Created by Noirdemort on 27/01/21.
//

import SwiftUI

/// Represents Booked Data, later should show Sign-In with Apple
///
/// Source of Truth: BookingView.ticket
/// 
/// Interaction Index: 4
struct BookedView: View {
    
    @ObservedObject var ticket: Ticket
    
    var body: some View {
        VStack {
            Spacer()
            Text("Ticket Booked")
                .font(.title)
            
            Spacer()
            Text("Payment Status: \(ticket.paymentStatus.rawValue.capitalized)")
            Text("PNR: \(ticket.PNR ?? "N/A")")
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct BookedView_Previews: PreviewProvider {
    @StateObject static var ticket = fetchTicket()
    static var previews: some View {
        BookedView(ticket: ticket)
    }
}
