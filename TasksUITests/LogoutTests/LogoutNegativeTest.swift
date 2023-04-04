//
//  LogoutNegativeTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class LogoutNegativeTest: BaseTest {
    
    let email = "dummy@gmail.com"
    let password = "1"
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }

    func testLogoutNotFinished() throws {

        let loginScreen = LoginScreen()
        loginScreen.login(email: email, pass: password)
        
        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.logoutButton.tap()
        tasksScreen.chooseLogout(option: .cancel)
        
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 2), "User is logged out")
    }
}
