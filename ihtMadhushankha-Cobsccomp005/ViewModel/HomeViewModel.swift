//
//  HomeViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import Foundation
import Firebase

class HomeViewModel: ObservableObject {
    @Published var parkModel = [ParkModel]()
    @Published var uservehicle = ""
    
    
    func getRemainTime(dateValue: Date) -> Int {
        let caldate: Date = dateValue
        let interval = Date() - caldate
        return interval.minute!
    }
    
    func fetchAllData() {
        Firestore
            .firestore()
            .collection("parkSlots")
            .order(by: "parkName")
            .whereField("booked", isEqualTo: false)
            .whereField("reserved", isEqualTo: false)
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                for document in snapshot.documents {
                    let documentData = document.data()
                    if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool, let bookTime = documentData["bookTime"] as? Timestamp {
                        
                        self.getDocument(userId: userId)
                        self.parkModel.removeAll()
                        //                            let caldate: Date = bookTime.dateValue()
                        //                            let interval = Date() - caldate
                        //                            print(interval.minute!)
                        
                        
                        let date: Date = bookTime.dateValue()
                        
                        let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "", bookTime: date)
                        
                        let docRef1 = Firestore.firestore().collection("users").document(userId)
                        
                        docRef1.getDocument { (document, error) in
                            if let document = document, document.exists {
                                _ = document.data().map(String.init(describing:)) ?? "nil"
                                let fieldValue = document.get("vehicleNumber") as? String
                                let ParkModel1 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: fieldValue ?? "", bookTime: date)
                                self.parkModel.append(ParkModel1)
                            } else {
                                self.parkModel.append(ParkModel2)
                            }
                        }
                    }
                }
            }
    }
    func fetchBookReseveData() {
        Firestore
            .firestore()
            .collection("parkSlots")
            .whereField("booked", isEqualTo: true)
            .whereField("reserved", isEqualTo: true)
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                for document in snapshot.documents {
                    let documentData = document.data()
                    if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool, let bookTime = documentData["bookTime"] as? Timestamp {
                        
                        self.getDocument(userId: userId)
                        self.parkModel.removeAll()
                        //                            let date = bookTime.dateValue().getFormattedDate(format: "MMM d, h:mm a")
                        let date: Date = bookTime.dateValue()
                        
                        //                        if(self.getRemainTime(dateValue: date) > 10){
                        //                            self.updateDocument(documentId: userId)
                        //
                        //                        }
                        
                        
                        let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "", bookTime: date)
                        
                        let docRef1 = Firestore.firestore().collection("users").document(userId)
                        
                        docRef1.getDocument { (document, error) in
                            if let document = document, document.exists {
                                _ = document.data().map(String.init(describing:)) ?? "nil"
                                let fieldValue = document.get("vehicleNumber") as? String
                                let ParkModel1 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: fieldValue ?? "", bookTime: date)
                                self.parkModel.append(ParkModel1)
                            } else {
                                self.parkModel.append(ParkModel2)
                            }
                        }
                    }
                }
            }
    }
    func fetchBookData() {
        self.parkModel.removeAll()

        Firestore
            .firestore()
            .collection("parkSlots")
            .whereField("booked", isEqualTo: true)
            .whereField("reserved", isEqualTo: false)
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                for document in snapshot.documents {
                    let documentData = document.data()
                    if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool, let bookTime = documentData["bookTime"] as? Timestamp {
                        
                        self.getDocument(userId: userId)
//                        self.parkModel.removeAll()
                        let date: Date = bookTime.dateValue()
                        
                        let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "", bookTime: date)
                        
                        let docRef1 = Firestore.firestore().collection("users").document(userId)
                        
                        docRef1.getDocument { (document, error) in
                            if let document = document, document.exists {
                                _ = document.data().map(String.init(describing:)) ?? "nil"
                                let fieldValue = document.get("vehicleNumber") as? String
                                let ParkModel1 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: fieldValue ?? "", bookTime: date)
                                self.parkModel.append(ParkModel1)
                            } else {
                                self.parkModel.append(ParkModel2)
                            }
                        }
                    }
                }
            }
    }
    
    func getDocument(userId: String) {
        let docRef = Firestore.firestore().collection("users").document(userId)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                _ = document.data().map(String.init(describing:)) ?? "nil"
                let fieldValue = document.get("vehicleNumber") as? String
                DispatchQueue.main.async {
                    self.uservehicle = fieldValue! // << store result
                }
            } else {
                print("Document does not exist")
            }
        }
        // [END get_document]
    }
    
    func getDocumentFromFirebase(documentId: String,completion:@escaping(([String: String]?) -> ()))   {
        var firebaseResult = [String: String]()
        let docRef = Firestore.firestore().collection("users").document(documentId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("name") as! String
                firebaseResult["name"] = property
                completion(firebaseResult)
            } else {
                print("Document does not exist")
                completion(nil)
            }
        }
    }
    
    
    func updateUserDocument(documentId: String) {
        // [START update_document]
        let washingtonRef = Firestore.firestore().collection("users").document(documentId)
        
        // Set the "capital" field of the city 'DC'
        washingtonRef.updateData([
            "status": "bang",
            "parkId": "",
            "statusTime": Timestamp(date: Date())
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    func updateParkDocument(parkId: String) {
        // [START update_document]
        let washingtonRef = Firestore.firestore().collection("parkSlots").document(parkId)
        
        // Set the "capital" field of the city 'DC'
        washingtonRef.updateData([
            "booked": false,
            "reserved": false,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    
    func updatefetchAllData() {
        Firestore
            .firestore()
            .collection("parkSlots")
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                for document in snapshot.documents {
                    let documentData = document.data()
                    if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool, let bookTime = documentData["bookTime"] as? Timestamp {
                        
                        let date: Date = bookTime.dateValue()
                        if(booked && self.getRemainTime(dateValue: date) > 10){
                            self.updateUserDocument(documentId: userId)
                            self.updateParkDocument(parkId: documentId)
                        }
                    }
                }
            }
    }
}




extension Date {
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    static func -(recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second
        
        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
}
