//
//  LogoutFromSubtasksNegativeTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//
import XCTest

class LogoutFromSubtasksNegativeTest: BaseTest {

    func testLogoutFromSubtasksNotFinished() throws {

        let loginScreen = LoginScreen()
        try loginScreen.login()
        
        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 6), "User is not logged in")
        
        let subtasksScreen = SubTasksScreen()
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        tasksScreen.logout(option: .cancel)
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is logged out or in the wrong page")
    }
}
