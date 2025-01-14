//
//  GoalDetail.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct GoalDetail: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    ZStack {
                        
                        Text(viewModel.selectedGoal?.gName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetailGoal = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            })
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                .padding(.top)
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Image(viewModel.selectedGoal?.gPhoto ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .frame(height: 180)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                        
                        HStack {
                            
                            VStack(spacing: 16) {
                                
                                Text("Accumulated")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("$ \(viewModel.balance)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22, weight: .bold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                            
                            VStack(spacing: 16) {
                                
                                Text("Total")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("$ \(viewModel.selectedGoal?.gPrice ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22, weight: .bold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white.opacity(0.1)))
                        }
                        
                        GeometryReader { reader in
                            
                            let result = CGFloat((CGFloat(viewModel.balance) * reader.size.width)) / CGFloat(Int(viewModel.selectedGoal?.gPrice ?? "") ?? 0)
                            
                            ZStack(alignment: .leading, content: {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray.opacity(0.6))
                                    .frame(width: reader.size.width, height: 5)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("prim"))
                                    .frame(width: result, height: 11)
                            })
                        }
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedGoal?.gDescr ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isDeleteGoal = true
                    }
                    
                }, label: {
                    
                    Text("Delete")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim2")))
                })
                .padding()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteGoal ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteGoal = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Are you sure you want to delete this goal?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteGoal(withgName: viewModel.selectedGoal?.gName ?? "", completion: {
                                
                                viewModel.fetchGoals()
                            })
                            
                            viewModel.goal -= 1
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteGoal = false
                                viewModel.isDetailGoal = false

                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteGoal = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("ybg")))
                .padding()
                .offset(y: viewModel.isDeleteGoal ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    GoalDetail(viewModel: HomeViewModel())
}
