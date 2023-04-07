//
//  LoginWithEmptyPassTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class LoginWithEmptyPassTest: BaseTest {
    let email = "dummy@gmail.com"
    
    func testLoginWithEmptyPass() throws {
        
        let loginScreen = LoginScreen()
        
        loginScreen.emailField.tap()
        loginScreen.emailField.typeText(email)
        
        XCTAssertEqual(loginScreen.loginButton.isEnabled, false)
    }
    
    override func tearDown() {
        
    }
}
