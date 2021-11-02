//
//  User.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-23.
//

import Foundation

struct User {
    var userId: String = ""
    var name: String = ""
    var email: String = ""
    var vehicleNumber: String = ""
    var nic: String = ""
    var password: String = ""
    var status: String = ""
    
    func signUpValidate() throws {
        if (name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingName
        } else if (!name.isValidName){
            throw SignUpValidation.patternName
        } else if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingEmail
        } else if (!email.isValidEmail){
            throw SignUpValidation.patternEmail
        } else if (nic.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingNic
        }  else if (!nic.isValidNic){
            throw SignUpValidation.patternNic
        } else if (vehicleNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingvehicleNumber
        } else if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingPassword
        }
    }
    
    func signInValidate() throws {
        if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingEmail
        } else if (!email.isValidEmail){
            throw SignUpValidation.patternEmail
        } else if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingPassword
        }
    }
    
    func forgetValidate() throws {
        if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            throw SignUpValidation.missingEmail
        } else if (!email.isValidEmail){
            throw SignUpValidation.patternEmail
        }
    }
    
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: self)
    }
    var isValidNic: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^([0-9]{9}[x|X|v|V]|[0-9]{12})$").evaluate(with: self)
    }
    var isValidName: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]+").evaluate(with: self)
    }
}
