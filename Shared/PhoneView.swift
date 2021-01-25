//
//  PhoneView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI

struct PhoneView: View {
    @Binding var phone: TelCom
    
    var body: some View {
        HStack {
            Spacer(minLength: 5)
            TextField("Country Code", text: $phone.countryCode)
                .keyboardType(.numberPad)
            Spacer()
            TextField("Phone Number", text: $phone.number)
                .keyboardType(.numberPad)
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
