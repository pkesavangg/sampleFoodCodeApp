//
//  sampleApp.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 12/11/22.
//

import SwiftUI

@main
struct sampleApp: App {
   // @StateObject private var dataController = DataController()
    let persistenceController = PersistenceController.shared
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
