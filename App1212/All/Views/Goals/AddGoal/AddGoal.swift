//
//  AddGoal.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct AddGoal: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    ZStack {
                        
                        Text("Add goal")
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
                        
                        Menu(content: {
                            
                            ForEach(viewModel.pics, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curPic = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curPic.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 20, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.1)))
                                
                            } else {
                                
                                Image(viewModel.curPic)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.1)))
                            }
                        })
                        
                        Text("Name")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.gName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gName)
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
                                .opacity(viewModel.gPrice.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gPrice)
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
                                .opacity(viewModel.gDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.gDescr)
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
                        
                        viewModel.goal += 1
                        
                        viewModel.gPhoto = viewModel.curPic
                        
                        viewModel.addGoal()
                        
                        viewModel.gName = ""
                        viewModel.gPrice = ""
                        viewModel.gDescr = ""
                        
                        viewModel.fetchGoals()
                        
                        viewModel.curPic = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGoal = false
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
                    .opacity(viewModel.curPic.isEmpty || viewModel.gName.isEmpty || viewModel.gPrice.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.curPic.isEmpty || viewModel.gName.isEmpty || viewModel.gPrice.isEmpty ? true : false)
                }
            }
        }
    }
}

#Preview {
    AddGoal(viewModel: HomeViewModel())
}
