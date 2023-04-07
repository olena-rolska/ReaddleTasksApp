//
//  CompleteAllSubtasksCompleteTaskTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class CompleteAllSubtasksCompleteTaskTest: BaseTest {
    
    func testCompleteAllSubtasksCompleteTask() throws {
        let loginScreen = LoginScreen()
        try loginScreen.login()

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        let subtasksScreen = SubTasksScreen()
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        tasksScreen.manageAllTasks(option: .complete)
        try tasksScreen.checkAllTasksStatuses(status: tasksScreen.taskCompleted)
        
        subtasksScreen.backButton.tap()
        
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is on the wrong screen")
        let selectedTaskIndex: Int = 3
        let selectedTask = app.tables.cells.element(boundBy: selectedTaskIndex)
        let sleepTaskStatus = selectedTask.images["cell_image_view"].value
        
        try tasksScreen.checkTaskStatus(expectedStatus: sleepTaskStatus as! String, actualStatus: tasksScreen.taskCompleted)
        
    }
}
