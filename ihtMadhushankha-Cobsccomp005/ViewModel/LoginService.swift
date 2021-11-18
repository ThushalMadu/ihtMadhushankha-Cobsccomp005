//
//  LoginService.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-19.
//

import Firebase

protocol LoginServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

class LoginService: LoginServiceProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                completion(.failure(error!))
            } else {
                completion(.success(()))
                UserDefaults.standard.set(result!.user.uid, forKey: "userId")
            }
        }
    }
}
