//
//  GoalsView.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Text("Goals")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.bottom, 40)
                        .padding(.top)
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Total")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("\(viewModel.goal)")
                                .foregroundColor(.white)
                                .font(.system(size: 26, weight: .medium))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGoal = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                                .padding(8)
                                .background(Circle().fill(.white))
                        })
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 230)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                .ignoresSafeArea()
                
                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("You don’t have any properties in accumulation")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 12) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.goals, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedGoal = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetailGoal = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(spacing: 13) {
                                            
                                            Image(index.gPhoto ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30)
                                                .frame(height: 180)
                                                .frame(maxWidth: .infinity)
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
                                    })
                                }
                            })
                        }
                        .padding()
                    }
                }
            }
            
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
        .sheet(isPresented: $viewModel.isAddGoal, content: {
            
            AddGoal(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetailGoal, content: {
            
            GoalDetail(viewModel: viewModel)
        })
    }
    
    func calculatePercentage() -> Double {
        
        let value = viewModel.gPrice
        let maxValue = viewModel.balance
        
        let percentCircle = Double(Int(value) ?? 0) / Double(maxValue) * 100
        
        return percentCircle
    }
}

#Preview {
    GoalsView()
}
