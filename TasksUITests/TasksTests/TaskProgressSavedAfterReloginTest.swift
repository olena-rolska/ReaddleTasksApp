//
//  TaskProgressSavedAfterReloginTest.swift
//  TasksUITests
//
//  Created by Test on 06.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class TaskProgressSavedAfterReloginTest: BaseTest {
    
    func testTasksProgressSavedAfterRelogin() throws {
        let loginScreen = LoginScreen()
        try loginScreen.login()

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.selectedTask.tap()
        
        try tasksScreen.checkTaskStatus(expectedStatus: tasksScreen.selectedTaskStatus as! String, actualStatus: tasksScreen.taskCompleted)
        
        tasksScreen.logout(option: .logout)
        XCTAssert(loginScreen.loginButton.waitForExistence(timeout: 2), "User is not logged out")
        
        try loginScreen.login()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        
        try tasksScreen.taskProgressSaved()
        
    }
}
