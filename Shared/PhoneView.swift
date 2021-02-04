//
//  PhoneView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI

/// Presents a view to edit detail for the `TelCom` Model and update it
///
/// Source of truth: BookingView.ticket.phone
///
/// Interaction Index: 6
struct PhoneView: View {
    @Binding var phone: TelCom
    
    var body: some View {
        HStack {
            Spacer(minLength: 5)
            #if os(macOS)
            TextField("Country Code", text: $phone.countryCode)
            Spacer()
            TextField("Phone Number", text: $phone.number)
            #else
            TextField("Country Code", text: $phone.countryCode)
                .keyboardType(.numberPad)
            Spacer()
            TextField("Phone Number", text: $phone.number)
                .keyboardType(.numberPad)
            #endif
            Spacer(minLength: 5)
        }
    }
}

struct PhoneView_Previews: PreviewProvider {
    @State static var phone = TelCom(countryCode: .init(), number: .init())
    
    static var previews: some View {
        PhoneView(phone: PhoneView_Previews.$phone)
    }
}
