//
//  UncheckAllTasksTest.swift
//  TasksUITests
//
//  Created by Test on 05.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class UncheckAllTasksTest: BaseTest {
   
    func testUncheckAllTasks() throws {
        let loginScreen = LoginScreen()
        try loginScreen.login()

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")

        try tasksScreen.checkAllTasksStatuses(status: tasksScreen.taskUnchecked)
        
        tasksScreen.manageAllTasks(option: .complete)
        
        try tasksScreen.checkAllTasksStatuses(status: tasksScreen.taskCompleted)
        
        tasksScreen.manageAllTasks(option: .uncheck)
        
        try tasksScreen.checkAllTasksStatuses(status: tasksScreen.taskUnchecked)
    }
}

