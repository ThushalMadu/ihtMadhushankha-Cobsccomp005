//
//  LoginViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var loadHome = false
    @Published var isActiveLoginHome = false

    @Published var errorMessageLogin = ""
    @Published var errorAlert = false

    func login(email: String, password: String) {
        self.loadHome = true
        self.errorMessageLogin = ""
        self.errorAlert = false
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                self.loadHome = false
                self.errorMessageLogin = error?.localizedDescription ?? ""
                self.errorAlert = true
            } else {
                print(result!.user.uid)
                UserDefaults.standard.set(result!.user.uid, forKey: "userId")
                self.loadHome = false
                self.errorAlert = false
                self.isActiveLoginHome = true
                self.errorMessageLogin = ""
            }
        }
    }
}
