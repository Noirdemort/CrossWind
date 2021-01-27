//
//  PassengerView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI

struct PassengerView: View {
    
    @ObservedObject var ticket: Ticket
        
    @StateObject private var passenger = Passenger()
    
    private func removeRows(at offsets: IndexSet){
        ticket.passengers.remove(atOffsets: offsets)
    }
    
    private func addPassenger() {
        let pax = Passenger(salutation: passenger.salutation,
                            firstName: passenger.firstName,
                            middleName: passenger.middleName,
                            lastName: passenger.lastName)
        ticket.passengers.append(pax)
    }
    
    var body: some View {
        VStack {
            Form {
                
            Section(header: Text("Add Passenger")){
            
                Picker("Salutation", selection: $passenger.salutation){
                    ForEach(Salutation.allCases){
                        Text($0.rawValue).tag($0)
                    }
                }
                
                TextField("First Name", text: $passenger.firstName)
                TextField("Middle Name (Optional)", text: $passenger.middleName.bound)
                TextField("Last Name (Optional)", text: $passenger.lastName.bound)
                
                Button("Add Passenger") {
                    if !passenger.firstName.isEmpty {
                        addPassenger()
                    } else {
                        NSLog("Passenger details empty")
                        print(passenger)
                    }
                }
            }
            
            
            Section(header: Text("Passengers")){
                List {
                    ForEach(ticket.passengers, id: \.id) {
                        Text($0.fullName)
                    }
                    .onDelete(perform: removeRows)
                
                }
            }
                
            }
        }.frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
    }
}

struct PassengerView_Previews: PreviewProvider {
    @State static var pax: [Passenger] = [Passenger(salutation: .Mr, firstName: "John", lastName: "Appleseed"), Passenger(salutation: .Mr, firstName: "Tim", lastName: "Cook")]

    static var previews: some View {
        PassengerView(ticket: fetchTicket())
    }
}
