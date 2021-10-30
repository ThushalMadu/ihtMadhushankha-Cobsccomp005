//
//  ParkingView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-26.
//

import SwiftUI
import Firebase

struct ParkingView: View {
    @State var parkName = ""
    @State var userId = ""
    @State var booked:Bool = false
    @State var reserved:Bool = false
    @StateObject var contentView = ContentViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextFieldView(title: "Park Name", text: $parkName)
            TextFieldView(title: "User Id", text: $userId)
            Button(action: {  addParker(parkName: parkName, userId: userId, booked: false, reserved: false) }) {
                Text("ADD ME")
            }.padding(.top, 30.0)
        }
    }
}
func addParker(parkName: String, userId: String, booked: Bool, reserved: Bool){
    let parkData: [String: Any] = [
        "parkName": parkName,
        "userId": userId,
        "booked": booked,
        "parkCategory": "Normal",
        "reserved": reserved,
    ]
    do{
        Firestore.firestore().collection("parkSlots").document("20").setData(parkData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
struct ParkingView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingView()
    }
}
