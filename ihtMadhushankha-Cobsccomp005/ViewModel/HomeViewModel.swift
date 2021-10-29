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
    
    func fetchAllData() {
            Firestore
                .firestore()
                .collection("parkSlots")
                .whereField("booked", isEqualTo: false)
                .whereField("reserved", isEqualTo: false)
                .getDocuments { (snapshot, error) in
                    guard let snapshot = snapshot, error == nil else {
                        //handle error
                        return
                    }
                    for document in snapshot.documents {
                        let documentData = document.data()
                        if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool {
                            
                            self.getDocument(userId: userId)
                            self.parkModel.removeAll()
                            
                            let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "")
                            
                            let docRef1 = Firestore.firestore().collection("users").document(userId)
                            
                            docRef1.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    _ = document.data().map(String.init(describing:)) ?? "nil"
                                    let fieldValue = document.get("vehicleNumber") as? String
                                    let ParkModel1 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: fieldValue ?? "")
                                    self.parkModel.append(ParkModel1)
                                } else {
                                    print("fieldValue1 Document does not exist")
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
                        if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool {
                            
                            self.getDocument(userId: userId)
                            self.parkModel.removeAll()
                            
                            let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "")
                            
                            let docRef1 = Firestore.firestore().collection("users").document(userId)
                            
                            docRef1.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    _ = document.data().map(String.init(describing:)) ?? "nil"
                                    let fieldValue = document.get("vehicleNumber") as? String
                                    let ParkModel1 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: fieldValue ?? "")
                                    self.parkModel.append(ParkModel1)
                                } else {
                                    print("fieldValue1 Document does not exist")
                                    self.parkModel.append(ParkModel2)
                                }
                            }
                        }
                    }
                }
        }
    func fetchBookData() {
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
                        if let documentId = document.documentID as? String, let parkName = documentData["parkName"] as? String, let userId = documentData["userId"] as? String, let parkCategory = documentData["parkCategory"] as? String, let reserved = documentData["reserved"] as? Bool, let booked = documentData["booked"] as? Bool {
                            
                            self.getDocument(userId: userId)
                            self.parkModel.removeAll()
                            
                            let ParkModel2 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: "")
                            
                            let docRef1 = Firestore.firestore().collection("users").document(userId)
                            
                            docRef1.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    _ = document.data().map(String.init(describing:)) ?? "nil"
                                    let fieldValue = document.get("vehicleNumber") as? String
                                    let ParkModel1 = ParkModel(documentId: documentId,parkName: parkName, userId: userId, parkCategory: parkCategory, reserved: reserved, booked: booked, uservehicle: fieldValue ?? "")
                                    self.parkModel.append(ParkModel1)
                                } else {
                                    print("fieldValue1 Document does not exist")
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
                    print(fieldValue!)
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
                //print("Document data string: \(property)")
                firebaseResult["name"] = property
                completion(firebaseResult)
            } else {
                print("Document does not exist")
                completion(nil)
            }
        }
    }
    
}
