//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 30.11.2023.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
    init() {
            UserDefaults.standard.set(true, forKey: "com.apple.CoreData.SQLDebug")
        }
}
