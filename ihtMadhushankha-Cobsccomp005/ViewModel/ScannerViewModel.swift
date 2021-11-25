//
//  ScannerViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-15.
//

import Foundation
import Firebase

class ScannerViewModel: ObservableObject {
    
    /// Defines how often we are going to try looking for a new QR-code in the camera feed.
    @Published var scanInterval: Double = 5.0
    
    @Published var torchIsOn: Bool = false
    @Published var lastQrCode: String = ""
    @Published var showSucessUpdateUser = false
    @Published var showSucessUpdatePark = false
    @Published var showSucessAlert = false

    func onFoundQrCode(_ code: String) {
        self.lastQrCode = code
        self.showSucessAlert = true
    }
    func updateReserveDocument(documentId: String, userId: String) {
        // [START update_document]
        let parkUpdate = Firestore.firestore().collection("parkSlots").document(documentId)
        let userUpdate = Firestore.firestore().collection("users").document(userId)

        parkUpdate.updateData([
            "booked": false,
            "reserved": true,
            "userId": userId
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Update Book Document successfully")
                self.showSucessUpdatePark = true
            }
        }
        userUpdate.updateData([
            "status": "parked",
            "parkId": documentId,
            "statusTime": Timestamp(date: Date())
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Update Park Document successfully")
                self.showSucessUpdateUser = true
            }
        }
    }
}
