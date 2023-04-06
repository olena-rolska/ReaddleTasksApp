//
//  TaskProgressSavedAfterReloginTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class TaskProgressSavedAfterReloginTest: BaseTest {
    let email = "dummy@gmail.com"
    let password = "1"
    
    let taskCompleted = "Selected"
    let taskUnchecked = "Not selected"
    
    let firstTaskPosition = 4
    let secondTaskPosition = 3
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }
    
    func testTasksProgressSavedAfterRelogin() throws {
        let loginScreen = LoginScreen()
        loginScreen.login(email: email, pass: password)

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.selectedTask.tap()
        
        tasksScreen.checkTaskStatus(expectedStatus: tasksScreen.selectedTaskStatus, actualStatus: taskCompleted)
        
        tasksScreen.logout(option: .logout)
        XCTAssert(loginScreen.loginButton.waitForExistence(timeout: 2), "User is not logged out")
        
        loginScreen.login(email: email, pass: password)
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        
        tasksScreen.taskProgressSaved()
        
    }
}
