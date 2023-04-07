//
//  CompleteTaskCompleteSubtasksTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class CompleteTaskCompleteSubtasksTest: BaseTest {
    
    func testCompleteTaskCompleteSubtasks() throws {
        let loginScreen = LoginScreen()
        try loginScreen.login()

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        let sleepTaskIndex: Int = 3
        let sleepTask = app.tables.cells.element(boundBy: sleepTaskIndex)
        
        sleepTask.tap()
        
        try tasksScreen.checkTaskStatus(expectedStatus: sleepTask.images["cell_image_view"].value as! String, actualStatus: tasksScreen.taskCompleted)
        
        let subtasksScreen = SubTasksScreen()
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        try tasksScreen.checkAllTasksStatuses(status: tasksScreen.taskCompleted)
    }
}
