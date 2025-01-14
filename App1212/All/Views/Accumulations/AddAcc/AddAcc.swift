//
//  AddAcc.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct AddAcc: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    ZStack {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                     
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddAcc = false
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
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.acName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.acName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Price for one piece")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.acPrice.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.acPrice)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.acDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.acDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    }
                    .padding()
                    .padding(.bottom, 60)
                    
                    Button(action: {
                        
                        viewModel.balance += Int(viewModel.acPrice) ?? 0
                        
                        viewModel.addAccum()
                        
                        viewModel.acName = ""
                        viewModel.acPrice = ""
                        viewModel.acDescr = ""
                        
                        viewModel.fetchAccums()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddAcc = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                    })
                    .padding()
                    .opacity(viewModel.acName.isEmpty || viewModel.acPrice.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.acName.isEmpty || viewModel.acPrice.isEmpty ? true : false)
                }
            }
        }
    }
}

#Preview {
    AddAcc(viewModel: HomeViewModel())
}
