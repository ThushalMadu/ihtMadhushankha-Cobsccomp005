//
//  HomeViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import Foundation


import Foundation
import Firebase

class HomeViewModel: ObservableObject {
    @Published var parkModel = [ParkModel]()
    @Published var uservehicle = ""

    func fetchData() {
        Firestore
            .firestore()
            .collection("parkSlots")
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                self.parkModel = snapshot.documents.compactMap { documentSnapshot -> ParkModel? in
                    let documentData = documentSnapshot.data()
                    if let documentId = documentSnapshot.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool {
                        return ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked)
                    } else {
                        return nil
                    }
                }
            }
    }
    func getDocument(userId: String) {
        // [START get_document]
        print(userId)
        let docRef = Firestore.firestore().collection("users").document(userId)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                let fieldValue = document.get("vehicleNumber") as? String
                self.uservehicle = fieldValue ?? "No Number"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        // [END get_document]
    }
}
