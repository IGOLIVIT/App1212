//
//  RegistratiobViewModel.swift
//  App1212
//
//  Created by IGOR on 28/01/2025.
//

import SwiftUI

final class RegistratiobViewModel: ObservableObject {
    
    @Published var avatars: [String] = ["a1", "a2", "a3", "a4", "a5"]
    @Published var selectedAvatar: String = ""
    
    @AppStorage("status") var status: Bool = false

    @AppStorage("name") var name: String = ""
    @AppStorage("password") var password: String = ""
    @AppStorage("avatar") var avatar: String = ""

    @Published var addName: String = ""
    @Published var addPasw: String = ""
}

