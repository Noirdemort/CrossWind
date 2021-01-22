//
//  CrossWindApp.swift
//  Shared
//
//  Created by Noirdemort on 22/01/21.
//

import SwiftUI

@main
struct CrossWindApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
