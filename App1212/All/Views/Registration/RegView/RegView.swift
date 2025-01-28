//
//  RegView.swift
//  App1212
//
//  Created by IGOR on 28/01/2025.
//

import SwiftUI

struct RegView: View {

    @StateObject var viewModel = RegistratiobViewModel()

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Create an account in \(Text("SmartSave Tracker").foregroundColor(Color("prim2")))")
                    .foregroundColor(.white)
                    .font(.system(size: 42, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 100)
                    .padding(.bottom, 70)
                                
                Menu(content: {
                    
                    ForEach(viewModel.avatars, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.selectedAvatar = index
                            
                        }, label: {
                            
                            Image(index)
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.selectedAvatar.isEmpty {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 140, height: 140)
                            .background(Circle().fill(.white))
                        
                    } else {
                        
                        Image(viewModel.selectedAvatar)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                    }
                })
                
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
    RegView()
}
