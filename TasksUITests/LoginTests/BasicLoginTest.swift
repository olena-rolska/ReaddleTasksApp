//
//  LoginTests.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class BasicLoginTest: BaseTest {

    func testBasicLogin() throws {

        let loginScreen = LoginScreen()
        try loginScreen.login()
        
        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
    }
}
