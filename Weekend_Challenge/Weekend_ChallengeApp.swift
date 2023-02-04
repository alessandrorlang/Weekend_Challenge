//
//  Weekend_ChallengeApp.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 01/02/23.
//

import SwiftUI

@main
struct Weekend_ChallengeApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(TaskViewModel())
        }
    }
}
