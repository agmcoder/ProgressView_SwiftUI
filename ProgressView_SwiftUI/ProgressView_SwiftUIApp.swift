//
//  ProgressView_SwiftUIApp.swift
//  ProgressView_SwiftUI
//
//  Created by Alejandro Gómez Martín on 24/4/22.
//

import SwiftUI

@main
struct ProgressView_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
