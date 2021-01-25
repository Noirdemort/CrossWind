//
//  BookingClipApp.swift
//  BookingClip
//
//  Created by Noirdemort on 22/01/21.
//

import SwiftUI

@main
struct BookingClipApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
