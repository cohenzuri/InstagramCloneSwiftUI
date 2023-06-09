//
//  InstagramCloneSwiftUIApp.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 24/03/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()

    return true
  }
}

@main
struct InstagramCloneSwiftUIApp: App {
    
    let persistenceController = PersistenceController.shared
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(AuthenticationViewModel.shared)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
