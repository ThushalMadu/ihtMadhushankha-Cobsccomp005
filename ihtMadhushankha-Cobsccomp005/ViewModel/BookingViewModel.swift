//
//  BookingViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-08.
//

import Foundation
import Firebase

class BookingViewModel: ObservableObject {
    
    @Published var parkModel = [ParkModel]()
    @Published var uservehicle = ""
    @Published var showSucessAlert = false
    @Published var parkDataLoader = false
    @Published var parkDataIDFirst = ""

    func updateDocument(documentId: String, userId: String) {
        // [START update_document]
        let parkUpdate = Firestore.firestore().collection("parkSlots").document(documentId)
        let userUpdate = Firestore.firestore().collection("users").document(userId)

        parkUpdate.updateData([
            "booked": true,
            "userId": userId,
            "bookTime": Timestamp(date: Date())
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                self.showSucessAlert = true
            }
        }
        userUpdate.updateData([
            "parkId": documentId,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                self.showSucessAlert = true
            }
        }
    }
    func updateBookDocument(documentId: String, userId: String) {
        // [START update_document]
        let parkUpdate = Firestore.firestore().collection("parkSlots").document(documentId)
        let userUpdate = Firestore.firestore().collection("users").document(userId)

        parkUpdate.updateData([
            "booked": false,
//            "userId": "",
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Update Book Document successfully")
                self.showSucessAlert = true
            }
        }
        userUpdate.updateData([
            "status": "bang",
            "parkId": "",
            "statusTime": Timestamp(date: Date())
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Update Park Document successfully")
                self.showSucessAlert = true
            }
        }
    }
    func fetchAllParkData() {
        self.parkDataLoader = true
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
                        self.parkDataLoader = false
                        print(self.parkModel.count)
                    }
                }
                self.parkDataIDFirst = self.parkModel.first?.documentId ?? "wait"
            }
    }
}
