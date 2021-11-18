//
//  ihtMadhushankha_Cobsccomp005Tests.swift
//  ihtMadhushankha-Cobsccomp005Tests
//
//  Created by Thushal Madhushankha on 2021-10-23.
//

import XCTest
@testable import ihtMadhushankha_Cobsccomp005

class ihtMadhushankha_Cobsccomp005Tests: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    var mockLoginService: MockLoginService!
    
    override func setUpWithError() throws {

        mockLoginService = MockLoginService()
        loginViewModel = .init(loginService: mockLoginService)
    }

    override func tearDownWithError() throws {

    }
    func testLoginSucessTrue() throws {
        
        mockLoginService.loginResult = .success(())
        
        loginViewModel.signIn(email: "thushal@gmail.com", password: "thushal123")
        XCTAssertTrue(loginViewModel.isActiveLoginHome)
        
    }
    func testLoginFailureTrue() throws {
        
        mockLoginService.loginResult = .failure(NSError(domain: "", code: -1, userInfo: nil))
        
        loginViewModel.signIn(email: "thusha@gmail.com", password: "thushal123")
        XCTAssertNotNil(loginViewModel.error)
        
    }
    func testExample() throws {
      
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
