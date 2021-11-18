//
//  MockLoginService.swift
//  ihtMadhushankha-Cobsccomp005Tests
//
//  Created by Thushal Madhushankha on 2021-11-19.
//

@testable import ihtMadhushankha_Cobsccomp005

class MockLoginService: LoginServiceProtocol{
    
    var loginResult: Result<Void, Error> = .success(())
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(loginResult)
    }
    
}
