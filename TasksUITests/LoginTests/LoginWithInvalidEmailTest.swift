//
//  LoginWithInvalidEmailTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class LoginWithInvalidEmailTest: BaseTest {
    
    let email = "dummy.com"
    let password = "1"
    
    func testLoginWithInvalidEmail() throws {
        let loginScreen = LoginScreen()
        
        try loginScreen.login(email: email, password: password)
        
        let errorMessage: XCUIElement = app.alerts.staticTexts["Error"]
        
        XCTAssert(errorMessage.waitForExistence(timeout: 2), "No alert met")
    }
    
    override func tearDown() {
        
    }
}
