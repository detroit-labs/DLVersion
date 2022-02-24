//
//  DLVersionAppApp.swift
//  DLVersion-WatchOS WatchKit Extension
//
//  Created by Vincent Frascello on 2/24/22.
//

import SwiftUI

@main
struct DLVersionAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
