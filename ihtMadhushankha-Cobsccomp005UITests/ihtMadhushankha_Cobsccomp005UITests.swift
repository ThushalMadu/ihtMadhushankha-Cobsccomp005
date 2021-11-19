//
//  ihtMadhushankha_Cobsccomp005UITests.swift
//  ihtMadhushankha-Cobsccomp005UITests
//
//  Created by Thushal Madhushankha on 2021-10-23.
//

import XCTest

class ihtMadhushankha_Cobsccomp005UITests: XCTestCase {
    
    var app: XCUIApplication!
    var contentViewList: XCUIElement!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testUIElementExistance() {
        
        let homeView_Text = app.staticTexts["HomeView_TextTitle"]
        let homeView_Scroll = app.scrollViews["HomeView_ScrollParkSlots"]
        //        let homeView_LazyVGrid = app.otherElements["HomeView_LazyVGrid"]
        //        let homeView_ProgressView = app.otherElements["HomeView_ProgressView"]
        let homeView_ParkSingleComp = app.buttons["HomeView_ParkSingleComp"]
        //        let avaliableElement = app.tabBars["HomeView_TopTab_Avaliable"]
        XCTAssertTrue(homeView_Text.exists, "Home View Title exists")
        //        XCTAssertTrue(avaliableElement.exists, "Home View TopTab Avaliable exists")
        XCTAssertTrue(homeView_Scroll.waitForExistence(timeout: 5), "Home View Scroll View exists")
        XCTAssertTrue(homeView_ParkSingleComp.waitForExistence(timeout: 6), "Home View Park Slots exists")
        //        XCTAssertTrue(homeView_LazyVGrid.waitForExistence(timeout: 5), "Home View LazyVGrid exists")
        //        XCTAssertTrue(homeView_ProgressView.waitForExistence(timeout: 5), "Home View Progressive View exists")
//                let tabBar = app.tabBars["Tab Bar"]
        //        tabBar.children(matching: .button).matching(identifier: "Login").element(boundBy: 0).tap()
        //        let tabBar1 = app.tabBars["Tab Bar"]
        //        tabBar1.children(matching: .button).matching(identifier: "Login").element(boundBy: 1).tap()
        //        XCUIApplication().collectionViews.scrollViews.cells.scrollViews.otherElements.otherElements["HomeView_ParkSlots"].buttons["P1-01, VIP"].tap()
        //        let homeButton = tabBar.buttons["Home"]
        //        homeButton.tap()
        //        tabBar.children(matching: .button).matching(identifier: "Login").element(boundBy: 1).tap()
        //        homeButton.tap()
    }
    
    
    
}
