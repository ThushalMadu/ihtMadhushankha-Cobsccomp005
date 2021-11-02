//
//  UserData.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-02.
//

import Foundation

//struct UserData: Codable {
//    var userId: String
//    var name: String
//    var email: String
//    var vehicleNumber: String
//    var nic: String
//    var status: String
//    var statusTime: Date
//}
struct UserData: Codable {
    let email, name, vehicleNumber: String
    let nic, status: String

    enum CodingKeys: String, CodingKey {
        case email, name
        case vehicleNumber, nic, status
    }
}
