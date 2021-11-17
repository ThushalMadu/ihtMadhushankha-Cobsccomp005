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
    @Published var errorMessageForget = ""
    @Published var errorAlertForget = false
    @Published var sucessDetail = false

    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        self.loadForget = true
        self.errorMessageForget = ""
        self.errorAlertForget = false
        self.sucessDetail = false
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                self.errorMessageForget = error?.localizedDescription ?? ""
                self.errorAlertForget = true
                self.loadForget = false
            } else {
                print("send email")
                self.sucessDetail = true
                self.loadForget = false
            }
        }
    }
}
