//
//  MyCoreDataApp.swift
//  MyCoreData
//
//  Created by Takumi_Hagi_BTC4 on 2023/06/15.
//

import SwiftUI

@main
struct MyCoreDataApp: App {
    let persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView()
            //            persistenceController.container.viewContextにmanagedObjectContextを格納
                .environment(\.managedObjectContext,persistenceController.container.viewContext)
        }
    }
}

