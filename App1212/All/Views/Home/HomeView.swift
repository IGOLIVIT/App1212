//
//  HomeView.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.bottom, 40)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Balance")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("$ \(viewModel.balance)")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Goals")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("\(viewModel.goal)")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Accumulation")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .regular))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.accums, id: \.self) { index in

                                        VStack(alignment: .leading) {
                                            
                                            Text(index.acName ?? "")
                                                .foregroundColor(.white.opacity(0.7))
                                                .font(.system(size: 17, weight: .regular))
                                            
                                            Text("$ \(index.acPrice ?? "")")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .semibold))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.1)))
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                .ignoresSafeArea()
                                    
                    Text("Goals")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
                
                if viewModel.goals.isEmpty {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("You don’t have any properties in goals")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                    }
                    
                } else {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        LazyHStack {
                            
                            ForEach(viewModel.goals, id: \.self) { index in
                            
                                VStack(spacing: 13) {
                                    
                                    Image(index.gPhoto ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                        .frame(height: 180)
                                        .frame(width: 220)
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                        .overlay(
                                            
                                            VStack {
                                                
                                                Text("%\(String(format: "%.f", Double(calculatePercentage())))")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .medium))
                                                    .padding(4)
                                                    .padding(.horizontal, 4)
                                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                
                                                Spacer()
                                            }
                                                .padding(8)
                                        )
                                    
                                    Text(index.gName ?? "")
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("$\(index.gPrice ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .regular))
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(height: 270)
                }
                
                Spacer()
            }
            
        }
        .onAppear {
            
            viewModel.fetchAccums()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = viewModel.gPrice
        let maxValue = viewModel.balance
        
        let percentCircle = Double(Int(value) ?? 0) / Double(maxValue) * 100
        
        return percentCircle
    }
}

#Preview {
    HomeView()
}
