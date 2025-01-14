//
//  R1.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 18) {
                    
                    Text("Welcome to SmartSave Tracker! ")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Your savings journey starts here.")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    
                }
                .padding()
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .frame(height: 360)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color("ybg")))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R1()
}
