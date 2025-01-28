//
//  LoginView.swift
//  App1212
//
//  Created by IGOR on 28/01/2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = RegistratiobViewModel()

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Log in to your account")
                    .foregroundColor(.white)
                    .font(.system(size: 42, weight: .bold))
                    .frame(width: 220)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 100)
                
                Spacer()
                
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(content: {
                    
                    Text("Enter")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .opacity(viewModel.addName.isEmpty ? 1 : 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("", text: $viewModel.addName)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("abg")))
                
                Text("Password")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack(content: {
                    
                    Text("Enter")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                        .opacity(viewModel.addPasw.isEmpty ? 1 : 0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("", text: $viewModel.addPasw)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .regular))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("abg")))
                
                Spacer()
                
                Button(action: {

                    viewModel.name = viewModel.addName
                    viewModel.password = viewModel.addPasw
                    
                    viewModel.status = true
                    
                }, label: {
                    
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white))
                })
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
