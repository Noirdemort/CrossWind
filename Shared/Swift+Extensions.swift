//
//  Swift+Extensions.swift
//  CrossWind
//
//  Created by Noirdemort on 25/01/21.
//

import Foundation

extension Optional where Wrapped == String {
    var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    
    public var bound: String {
        get {
            return _bound ?? .init()
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}


/// Done to Support String based List for SwiftUI
extension String: Identifiable {
    
    public var id: String { self }
    
}
