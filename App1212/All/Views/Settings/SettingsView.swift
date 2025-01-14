//
//  SettingsView.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    
                }
                .padding()
                .padding(.top)
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("bg"))
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(.white))
                                
                                Text("Rate us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Text("Rate")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(5)
                                    .padding(.horizontal, 6)
                                    .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim2")))
                            }
                            .padding(30)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/fa00ec4c-1f6f-44a4-94e2-e6b74b82f387") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("bg"))
                                    .font(.system(size: 13, weight: .regular))
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(.white))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Text("Read")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(5)
                                    .padding(.horizontal, 6)
                                    .background(RoundedRectangle(cornerRadius: 14).fill(Color("prim2")))
                            }
                            .padding(30)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
