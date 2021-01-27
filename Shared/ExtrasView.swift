//
//  ExtrasView.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import SwiftUI


struct ExtrasView: View {
    var extras: [String: String] = [:]
    
    private var keys: [String] {
        return extras.map { $0.key }
    }
    
    
    var body: some View {
        List(keys) { Text("\($0): \(extras[$0] ?? "N/A")") }
    }
}

struct ExtrasView_Previews: PreviewProvider {
    static var previews: some View {
        ExtrasView()
    }
}
