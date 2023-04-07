//
//  LogoutTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class LogoutTest: BaseTest {

    func testLogout() throws {

        let loginScreen = LoginScreen()
        try loginScreen.login()
        
        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.logout(option: .logout)
        
        XCTAssert(loginScreen.loginButton.waitForExistence(timeout: 2), "User is not logged out")
    }
    
    override func tearDown() {
        
    }
}
