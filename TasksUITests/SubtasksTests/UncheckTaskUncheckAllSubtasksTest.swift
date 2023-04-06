//
//  UncheckTaskUncheckAllSubtasksTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class UncheckTaskUncheckAllSubtasksTest: BaseTest {
    let email = "dummy@gmail.com"
    let password = "1"
    
    let taskCompleted = "Selected"
    let taskUnchecked = "Not selected"
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }
    
    func testUncheckTaskUncheckAllSubtasks() throws {
        let loginScreen = LoginScreen()
        loginScreen.login(email: email, pass: password)

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        let sleepTaskIndex: Int = 3
        let sleepTask = app.tables.cells.element(boundBy: sleepTaskIndex)
        
        sleepTask.tap()
        tasksScreen.checkTaskStatus(expectedStatus: sleepTask.images["cell_image_view"].value, actualStatus: taskCompleted)
        
        let subtasksScreen = SubTasksScreen()
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        tasksScreen.checkAllTasksStatuses(status: taskCompleted)
        
        subtasksScreen.backButton.tap()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is on the wrong screen")
        sleepTask.tap()
        tasksScreen.checkTaskStatus(expectedStatus: sleepTask.images["cell_image_view"].value, actualStatus: taskUnchecked)
        
        subtasksScreen.moreInfoButton.tap()
        XCTAssert(subtasksScreen.subtasksPageTitle.waitForExistence(timeout: 2), "User is not on the subtasks screen")
        
        tasksScreen.checkAllTasksStatuses(status: taskUnchecked)
        
    }
}

