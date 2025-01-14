//
//  LoadingView.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Spacer()
                
                ProgressView()
                
            }
            .padding(.vertical, 200)
        }
    }
}

#Preview {
    LoadingView()
}
