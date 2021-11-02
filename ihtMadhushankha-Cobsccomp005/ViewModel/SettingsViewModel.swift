//
//  SettingsViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-02.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class SettingsViewModel: ObservableObject {
    
    @Published var userData = [UserData]()
    @Published var email = ""
    @Published var name = ""
    @Published var vehicleNumber = ""
    @Published var nic = ""
    @Published var status = ""
    
    
    
    func getJStoreUserFromDB(documentId: String) {
        let docRef = Firestore.firestore().collection("users").document(documentId)
        
        docRef.getDocument { (document, error) in
            let result = Result {
                try document?.data(as: UserData.self).asDictionary()
            }
            switch result {
            case .success(let user):
                if let user = user {
                    // A `City` value was successfully initialized from the DocumentSnapshot.
                    self.name = user["name"] as? String ?? ""
                    self.email = user["email"] as? String ?? ""
                    self.vehicleNumber = user["vehicleNumber"] as? String ?? ""
                    self.nic = user["nic"] as? String ?? ""
                    self.status = user["status"] as? String ?? ""
                                        
                } else {
                    // A nil value was successfully initialized from the DocumentSnapshot,
                    // or the DocumentSnapshot was nil.
                    print("Document does not exist")
                }
            case .failure(let error):
                // A `City` value could not be initialized from the DocumentSnapshot.
                print("Error decoding city: \(error)")
            }
        }
    }
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
