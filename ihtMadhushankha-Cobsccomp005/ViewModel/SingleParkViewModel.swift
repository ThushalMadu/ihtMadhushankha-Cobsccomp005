//
//  SingleParkViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-30.
//

import Foundation
import Firebase

class SingleParkViewModel: ObservableObject {
    
    @Published var parkModel = [ParkModel]()
    @Published var uservehicle = ""
    @Published var showSucessAlert = false

    func updateDocument(documentId: String) {
        // [START update_document]
        let washingtonRef = Firestore.firestore().collection("parkSlots").document(documentId)
        
        // Set the "capital" field of the city 'DC'
        washingtonRef.updateData([
            "booked": true
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                self.showSucessAlert = true
            }
        }
    }
    func updateBookDocument(documentId: String) {
        // [START update_document]
        let washingtonRef = Firestore.firestore().collection("parkSlots").document(documentId)
        
        // Set the "capital" field of the city 'DC'
        washingtonRef.updateData([
            "booked": false
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
