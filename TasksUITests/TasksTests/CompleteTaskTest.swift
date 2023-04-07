//
//  CompleteTaskTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class CompleteTask: BaseTest {

    func testCompleteTask() throws {
        let loginScreen = LoginScreen()
        try loginScreen.login()

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.selectedTask.tap()
        
        try tasksScreen.checkTaskStatus(expectedStatus: tasksScreen.selectedTaskStatus as! String, actualStatus: tasksScreen.taskCompleted)
        
        tasksScreen.checkOtherTasksStatuses(status: tasksScreen.taskUnchecked)
        
    }
}
