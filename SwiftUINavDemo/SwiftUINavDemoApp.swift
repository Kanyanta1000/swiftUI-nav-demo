//
//  SwiftUINavDemoApp.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 08.12.2020.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return true
    }
}

@main
struct SwiftUINavDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        print("🚀 Application starting up")
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .onChange(of: scenePhase) {
            newScenePhase in
            switch newScenePhase {
            case .background:
                print("🧘🏾‍♂️ background")
            case .inactive:
                print("😴 inactive")
            case .active:
                print("🤸🏾‍♂️ active")
            @unknown default:
                print("⁉️ unknown default")
            }
        }
    }
}
