//
//  UncheckAllSubtasksTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class UncheckAllSubtasksTest: BaseTest {
    let email = "dummy@gmail.com"
    let password = "1"
    
    let taskCompleted = "Selected"
    let taskUnchecked = "Not selected"
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }
    
    func testUncheckAllSubtasks() throws {
        let loginScreen = LoginScreen()
        loginScreen.login(email: email, pass: password)

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")

        let subtasksScreen = SubTasksScreen()
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        tasksScreen.manageAllTasks(option: .complete)
        
        tasksScreen.checkAllTasksStatuses(status: taskCompleted)
        
        tasksScreen.manageAllTasks(option: .uncheck)
        
        tasksScreen.checkAllTasksStatuses(status: taskUnchecked)
    }
}

