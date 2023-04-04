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
    
    public func login(email: String, pass: String) {
        
        //emailField.waitForExistence(timeout: 2)
        emailField.tap()
        emailField.typeText(email)
        
        passwordField.tap()
        passwordField.typeText(pass)
        
        loginButton.tap()
    }
}
