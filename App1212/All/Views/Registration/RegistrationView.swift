//
//  RegistrationView.swift
//  App1212
//
//  Created by IGOR on 28/01/2025.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistratiobViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Welcome to \(Text("SmartSave").foregroundColor(Color("prim2"))) Tracker")
                    .foregroundColor(.white)
                    .font(.system(size: 42, weight: .bold))
                    .frame(width: 220)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 100)
                
                Spacer()
                
                VStack(spacing: 17) {
                    
                    NavigationLink(destination: {
                        
                        LoginView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    
                    NavigationLink(destination: {
                        
                        RegView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Registration")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white))
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    RegistrationView()
}
