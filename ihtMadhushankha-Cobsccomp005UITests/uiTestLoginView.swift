//
//  uiTestLoginView.swift
//  ihtMadhushankha-Cobsccomp005UITests
//
//  Created by Thushal Madhushankha on 2021-11-20.
//

import XCTest

class uiTestLoginView: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
//        XCUIApplication().tabBars["Tab Bar"].children(matching: .button).matching(identifier: "Login").element(boundBy: 0)
    }
    
    override func tearDown() {
        app = nil
    }
    func testLoginViewElementExistance(){
                        
        let loginView_Image = app.images["LoginView_ImageView"]
        let loginView_TextView = app.staticTexts["LoginView_TextView"]
        let loginView_EmailField = app.textFields["LoginView_EmailField"]
        let loginView_PassField = app.secureTextFields["LoginView_PassField"]
        let loginView_ForgetButton = app.buttons["LoginView_ForgetButton"]
        let loginView_LoginButton = app.buttons["LoginView_LoginButton"]
        let loginView_OrLabel = app.staticTexts["LoginView_OrLabel"]
        let loginView_NewUserButton = app.buttons["LoginView_NewUserButton"]


        XCTAssert(loginView_Image.exists)
        XCTAssertTrue(loginView_TextView.exists, "Login View Text View exists")
        XCTAssertTrue(loginView_EmailField.exists, "Login View Email Field exists")
        XCTAssertTrue(loginView_PassField.exists, "Login View Password Field exists")
        XCTAssertTrue(loginView_ForgetButton.exists, "Login View Forget Password Button exists")
        XCTAssertTrue(loginView_LoginButton.exists, "Login View Login Button exists")
        XCTAssertTrue(loginView_OrLabel.exists, "Login View Or Label exists")
        XCTAssertTrue(loginView_NewUserButton.exists, "Login View New User Create Button exists")
    }
    func testLoginFlow() {
            let email = app.textFields["LoginView_EmailField"]
            email.tap()
            email.typeText("thushal@gmail.com")

            let pwd = app.secureTextFields["LoginView_PassField"]
            pwd.tap()
            pwd.typeText("thushal123")

            app.buttons["LoginView_LoginButton"].tap()
        }
}
