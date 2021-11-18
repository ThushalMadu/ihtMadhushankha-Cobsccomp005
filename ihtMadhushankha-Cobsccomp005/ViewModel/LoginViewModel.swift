//
//  LoginViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import Foundation
import Firebase
import Combine



class LoginViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var loadHome = false
    @Published var isActiveLoginHome = false
    @Published var errorMessageLogin = ""
    @Published var errorAlert = false
    @Published var error:Error?
    
    private var loginService:LoginServiceProtocol
    
    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }
    
    func signIn(email: String, password: String) {
        self.loadHome = true
        self.errorMessageLogin = ""
        self.errorAlert = false
        loginService.login(email: email, password: password) { result in
            switch result {
            case .success:
                print(result)
                self.loadHome = false
                self.errorAlert = false
                self.isActiveLoginHome = true
                self.errorMessageLogin = ""
            case let .failure(error) :
                print(error.localizedDescription)
                self.loadHome = false
                self.errorMessageLogin = error.localizedDescription
                self.errorAlert = true
            }
        }
        
    }
    
    
    
    //    func login(email: String, password: String) {
    //        self.loadHome = true
    //        self.errorMessageLogin = ""
    //        self.errorAlert = false
    //        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
    //            if error != nil {
    //                print(error?.localizedDescription ?? "")
    //                self.loadHome = false
    //                self.errorMessageLogin = error?.localizedDescription ?? ""
    //                self.errorAlert = true
    //            } else {
    //                print(result!.user.uid)
    //                UserDefaults.standard.set(result!.user.uid, forKey: "userId")
    //                self.loadHome = false
    //                self.errorAlert = false
    //                self.isActiveLoginHome = true
    //                self.errorMessageLogin = ""
    //            }
    //        }
    //    }
    
    
}
