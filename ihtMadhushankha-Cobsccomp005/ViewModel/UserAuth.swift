//
//  UserAuth.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-16.
//

import Foundation

class UserAuth: ObservableObject {
    @Published var isLoggedOut = false     // published property to update view

    func login() {
        // login request... on success:
//        self.isLoggedin = true
    }

    func logout() {
        UserDefaults.standard.set(nil, forKey: "userId")
        isLoggedOut = true
        print("done calling logout")
    }
    
}
