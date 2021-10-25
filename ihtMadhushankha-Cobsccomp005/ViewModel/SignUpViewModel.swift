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
    
    func addUser(name: String, email: String, nic: String, vehicleNumber: String, password:String){
        let docData: [String: Any] = [
            "name": name,
            "email": email,
            "nic": nic,
            "vehicleNumber": vehicleNumber,
        ]
        self.loadHome = true
        Auth.auth().createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
                guard let userID = Auth.auth().currentUser?.uid else { return }
                do{
                    self.db.collection("users").document(userID).setData(docData) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                            self.loadHome = false
                        } else {
                            print("Document successfully written!")
                            self.loadHome = false
                        }
                    }
                }
            }
        }
        )
    }
}
