//
//  PassengerView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI

struct PassengerView: View {
    
    @Binding var passengers: [Passenger]
    
    @StateObject private var passenger = Passenger()
    
    private func removeRows(at offsets: IndexSet){
        passengers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                    print(#function)
                    if !passenger.firstName.isEmpty {
                        print("adding passenger")
                        passengers.append(passenger)
                    } else {
                        NSLog("Passenger details empty")
                        print(passenger)
                    }
                }
            }
            
            
            Section(header: Text("Passengers")){
                List {
                    ForEach(passengers, id: \.id) {
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
    static var previews: some View {
        PassengerView()
    }
}
