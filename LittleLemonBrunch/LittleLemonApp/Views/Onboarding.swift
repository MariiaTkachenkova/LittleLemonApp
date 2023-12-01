//
//  Onboarding.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 30.11.2023.
//

import SwiftUI

struct Onboarding: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    
    @State private var isLoggedIn = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 185, height: 40)
                    .clipped()
                    .padding(.bottom, 50)
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .frame(width: 428, height: 309)
                    
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 139, height: 144)
                        .clipped()
                        .cornerRadius(16)
                        .frame(width: 200, height: 100)
                        .frame(width: 1, alignment: .leading)
                    
                    VStack(spacing: 20) {
                        Text("Little Lemon")
                            .font(
                                Font.custom("Markazi Text", size: 64)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                            .frame(width: 350, alignment: .leading)
                            .padding(.top)
                        
                        Text("Chicago")
                            .font(Font.custom("Markazi Text", size: 60))
                            .foregroundColor(.white)
                            .frame(height: 30)
                            .frame(width: 350, alignment: .leading)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(Font.custom("Inter", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 200, height: 100)
                            .frame(width: 350, alignment: .leading)
                        }
                }
                .padding(.bottom, 20)
                Text("Login to your Account")
                    .font(
                        Font.custom("Karla", size: 15)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                    .frame(width: 350, alignment: .leading)
                
                
                TextField("Name", text: $name)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                    .padding()
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                    .padding()
                
                Button(action: {
                    if !name.isEmpty && !password.isEmpty {
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                            isLoggedIn = true
                            
                        }
                    }

                }) {
                    Text("Sign in")
                        .font(Font.custom("Karla", size: 15))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.29, green: 0.37, blue: 0.34))
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
                }
                .frame(maxWidth: .infinity)
                .padding()

            }
            .navigationBarHidden(true)
            .padding()
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    Onboarding()
}
