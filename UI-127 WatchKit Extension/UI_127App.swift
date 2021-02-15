//
//  UI_127App.swift
//  UI-127 WatchKit Extension
//
//  Created by にゃんにゃん丸 on 2021/02/15.
//

import SwiftUI

@main
struct UI_127App: App {
    let container = PersistenceController.shared.container
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    
            }
            .environment(\.managedObjectContext, container.viewContext)
            
           
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
