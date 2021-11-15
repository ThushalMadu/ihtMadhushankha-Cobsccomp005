//
//  SignUpViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import Foundation
import Firebase

class SignUpViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var loadHome = false
    @Published var isActiveHome = false
    @Published var errorMessageSignUp = ""
    @Published var errorAlertSignUp = false
    func addUser(name: String, email: String, nic: String, vehicleNumber: String, password:String){
        let docData: [String: Any] = [
            "name": name,
            "email": email,
            "nic": nic,
            "vehicleNumber": vehicleNumber,
            "parkId": "",
            "status": "active",
            "statusTime": Timestamp(date: Date())
        ]
        self.loadHome = true
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
//                print(error?.localizedDescription ?? "")
                self.loadHome = false
                print("Error Duplicate email: \(error?.localizedDescription ?? "")")
                self.errorAlertSignUp = true
                self.errorMessageSignUp = error?.localizedDescription ?? ""
                
            } else {
                print("success")
                guard let userID = Auth.auth().currentUser?.uid else { return }
                do{
                    self.db.collection("users").document(userID).setData(docData) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                            self.errorAlertSignUp = true
                            self.errorMessageSignUp = err.localizedDescription
                            self.loadHome = false
                        } else {
                            self.errorMessageSignUp = ""
                            self.errorAlertSignUp = false
                            print("Document successfully written!")
                            UserDefaults.standard.set(userID, forKey: "userId")
                            self.loadHome = false
                            self.isActiveHome = true
                        }
                    }
                }
            }
        }
        )
    }
}
