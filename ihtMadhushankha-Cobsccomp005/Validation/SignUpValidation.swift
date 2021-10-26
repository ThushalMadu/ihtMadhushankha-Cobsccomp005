//
//  SignUpValidation.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-27.
//

import Foundation

enum SignUpValidation: LocalizedError {
    case missingName
    case patternName
    case missingEmail
    case patternEmail
    case missingvehicleNumber
    case missingNic
    case patternNic
    case missingPassword

    var errorDescription: String? {
        switch self {
        case .missingName:
            return "You have to Provide a name"
        case .patternName:
            return "You have to Provide a Valid name"
        case .missingEmail:
            return "You have to Provide a Email"
        case .patternEmail:
            return "You have to Provide a Valid Email"
        case .missingvehicleNumber:
            return "You have to Provide a Vehicle Number"
        case .missingNic:
            return "You have to Provide a NIC"
        case .patternNic:
            return "You have to Provide a Valid NIC"
        case .missingPassword:
            return "You have to Provide a Password"
        }
    }
}
