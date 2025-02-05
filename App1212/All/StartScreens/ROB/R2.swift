//
//  R2.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct R2: View {
        
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 18) {

                    Text("Track investments, set goals, and achieve financial freedom!")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        RegistrationView()
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
    R2()
}
