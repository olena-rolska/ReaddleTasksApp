//
//  BaseTest.swift
//  TasksUITests
//
//  Created by Olena Rolska on 03.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func deleteApp() {
        app.terminate()
        
        let icon = BaseScreen.springboard.icons["Tasks"]
        icon.press(forDuration: 1.3)
        
        let removeAppButton = BaseScreen.springboard.buttons.element(boundBy: 1)
        removeAppButton.tap()
        
        let deleteAppButton = BaseScreen.springboard.buttons.element(boundBy: 0)
        if deleteAppButton.waitForExistence(timeout: 2) {
            deleteAppButton.tap()
        }
        else {
            XCTFail("Delete app button not found")
        }
        
        let deleteButton = BaseScreen.springboard.buttons.element(boundBy: 1)
        if deleteButton.waitForExistence(timeout: 2) {
            deleteButton.tap()
        }
        else {
            XCTFail("Delete button not found")
        }
    }
}

