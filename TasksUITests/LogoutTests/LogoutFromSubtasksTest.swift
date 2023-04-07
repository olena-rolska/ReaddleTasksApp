//
//  LogoutFromSubtasksTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class LogoutFromSubtasksTest: BaseTest {
    
    let email = "dummy@gmail.com"
    let password = "1"

    func testLogoutFromSubtasks() throws {

        let loginScreen = LoginScreen()
        try loginScreen.login()
        
        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        let subtasksScreen = SubTasksScreen()
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        tasksScreen.logout(option: .logout)
        XCTAssert(loginScreen.loginButton.waitForExistence(timeout: 2), "User is not logged out")
    }
    
    override func tearDown() {
        
    }
}
