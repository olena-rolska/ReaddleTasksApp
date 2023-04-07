//
//  LoginScreen.swift
//  TasksUITests
//
//  Created by Olena Rolska on 03.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class LoginScreen: BaseScreen {

    let emailField: XCUIElement = app.textFields["password-text-field"]
    let passwordField: XCUIElement = app.secureTextFields["Password"]
    let loginButton: XCUIElement = app.buttons["login-button"]
    
    let tasksPage = app.staticTexts["Tasks"]
    let errorAlert = app.alerts.buttons["Retry"]
    let loginProgressLoader = app.staticTexts["Logging in"]
    
    public func login(email: String = "dummy@gmail.com", password: String = "1") throws {
        
        emailField.tap()
        emailField.typeText(email)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        loginButton.tap()
        
        loginProgressLoader.waitForExistence(timeout: 2)
        
        if errorAlert.exists {
            errorAlert.tap()
        }
        
        loginProgressLoader.waitForExistence(timeout: 1)
        XCTAssertTrue(!errorAlert.exists, "Extra login alert")
    }
}
