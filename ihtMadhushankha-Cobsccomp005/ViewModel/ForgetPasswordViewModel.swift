//
//  ForgetPasswordViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import Foundation
import Firebase

class ForgetPasswordViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var loadForget = false
    @Published var errorMessageLogin = ""
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        self.loadForget = true
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                self.errorMessageLogin = error?.localizedDescription ?? ""
                self.loadForget = false
            } else {
                print("send email")
                self.loadForget = false
            }
        }
    }
}
