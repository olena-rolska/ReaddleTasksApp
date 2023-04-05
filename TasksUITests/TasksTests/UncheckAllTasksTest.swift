//
//  UncheckAllTasksTest.swift
//  TasksUITests
//
//  Created by Test on 05.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class UncheckAllTasksTest: BaseTest {
    let email = "dummy@gmail.com"
    let password = "1"
    
    let taskCompleted = "Selected"
    let taskUnchecked = "Not selected"
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }
    
    func testUncheckAllTasks() throws {
        let loginScreen = LoginScreen()
        loginScreen.login(email: email, pass: password)

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")

        tasksScreen.checkAllTasksStatuses(status: taskUnchecked)
        
        tasksScreen.manageAllTasks(option: .complete)
        
        tasksScreen.checkAllTasksStatuses(status: taskCompleted)
        
        tasksScreen.manageAllTasks(option: .uncheck)
        
        tasksScreen.checkAllTasksStatuses(status: taskUnchecked)
    }
}

