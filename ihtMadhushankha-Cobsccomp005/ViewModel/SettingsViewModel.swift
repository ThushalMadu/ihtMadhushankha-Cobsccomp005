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
                    // A `City` value was successfully initialized from the DocumentSnapshot.
                    print(user)
//                    let date: Date = (user["statusTime"] as? Timestamp).dateValue()
                    self.userData = [UserData(email: user["email"] as? String ?? "", name: user["name"] as? String ?? "", nic: user["nic"] as? String ?? "", parkId: user["parkId"] as? String ?? "", status: user["status"] as? String ?? "", vehicleNumber: user["vehicleNumber"] as? String ?? "")]
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
    func fetchAllParkData() {
        self.parkModel.removeAll()
        Firestore
            .firestore()
            .collection("parkSlots")
            .order(by: "parkName")
            .whereField("booked", isEqualTo: false)
            .whereField("parkCategory", isEqualTo: "Normal")
            .whereField("reserved", isEqualTo: false)
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                for document in snapshot.documents {
                    let documentData = document.data()
                    if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool, let bookTime = documentData["bookTime"] as? Timestamp {
                        let date: Date = bookTime.dateValue()
                        let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "", bookTime: date)
                        self.parkModel.append(ParkModel2)
                        print(self.parkModel.count)
                    }
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
