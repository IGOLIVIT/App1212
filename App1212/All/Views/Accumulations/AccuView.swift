//
//  AccuView.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct AccuView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    Text("Accumulation")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.bottom, 40)
                        .padding(.top)
                    
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

                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddAcc = true
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
                                    
                    Text("Goals")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)

                if viewModel.accums.isEmpty {
                    
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
                        
                        LazyVStack(spacing: 12) {
                            
                            ForEach(viewModel.accums, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 13) {
                                    
                                    Text(index.acName ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                    
                                    Text(index.acDescr ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text("$\(index.acPrice ?? "")")
                                        .foregroundColor(.white.opacity(0.6))
                                        .font(.system(size: 14, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            }
                        }
                        .padding()
                    }
                }
            }
            
        }
        .onAppear {
            
            viewModel.fetchAccums()
        }
        .sheet(isPresented: $viewModel.isAddAcc, content: {
            
            AddAcc(viewModel: viewModel)
        })
    }
}

#Preview {
    AccuView()
}
