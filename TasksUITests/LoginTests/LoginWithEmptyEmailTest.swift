//
//  LoginWithEmptyEmailTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class  LoginWithEmptyEmailTest: BaseTest {
    let password = "1"
    
    func testLoginWithEmptyEmail() throws {
        let loginScreen = LoginScreen()
        
        XCTAssertEqual(loginScreen.loginButton.isEnabled, false)
        
        loginScreen.passwordField.tap()
        loginScreen.passwordField.typeText(password)
        
        XCTAssertEqual(loginScreen.loginButton.isEnabled, false)
    }
}
