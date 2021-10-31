//
//  ParkModel.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-26.
//

import Foundation
import Firebase

struct ParkModel {
    var documentId: String
    var parkName : String
    var userId: String
    var parkCategory:String
    var reserved: Bool
    var booked: Bool
    var uservehicle:String
    var bookTime:Date
}
