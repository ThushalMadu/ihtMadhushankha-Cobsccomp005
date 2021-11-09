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

    func updateDocument(documentId: String, userId: String) {
        // [START update_document]
        let parkUpdate = Firestore.firestore().collection("parkSlots").document(documentId)
        let userUpdate = Firestore.firestore().collection("users").document(userId)

        // Set the "capital" field of the city 'DC'
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

        // Set the "capital" field of the city 'DC'
        parkUpdate.updateData([
            "booked": false,
//            "userId": "",
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                self.showSucessAlert = true
            }
        }
        userUpdate.updateData([
            "parkId": "",
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                self.showSucessAlert = true
            }
        }
    }
    
}
