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
    @Published var parkModel = [ParkModel]()
    @Published var uservehicle = ""

    
    
    func getJStoreUserFromDB(documentId: String) {
        let docRef = Firestore.firestore().collection("users").document(documentId)
        self.userData.removeAll()

        docRef.getDocument { (document, error) in
            let result = Result {
                try document?.data(as: UserData.self).asDictionary()
            }
            switch result {
            case .success(let user):
                if let user = user {
                    print(user)
                    self.userData = [UserData(email: user["email"] as? String ?? "", name: user["name"] as? String ?? "", nic: user["nic"] as? String ?? "", parkId: user["parkId"] as? String ?? "", status: user["status"] as? String ?? "", vehicleNumber: user["vehicleNumber"] as? String ?? "")]
                } else {
                    print("Document does not exist")
                }
            case .failure(let error):
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
