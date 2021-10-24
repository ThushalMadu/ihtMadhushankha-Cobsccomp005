//
//  ContentViewModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-23.
//

import Foundation
import Firebase

class ContentViewModel: ObservableObject {
    
    func fetchData() {
        Firestore
            .firestore()
            .collection("park")
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                print(snapshot)
            }
    }
}
