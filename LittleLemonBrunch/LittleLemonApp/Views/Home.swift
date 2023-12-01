//
//  Home.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 30.11.2023.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    var body: some View {
        
        TabView {
            Menu()
                .tabItem {
                    Text("Menu")
                    Image(systemName: "list.bullet")
                }
                .navigationBarHidden(true)
                .environment(\.managedObjectContext, persistence.container.viewContext)
            
            UserProfile()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "square.and.pencil")

                }
        }
    }
}

#Preview {
    Home()
}
