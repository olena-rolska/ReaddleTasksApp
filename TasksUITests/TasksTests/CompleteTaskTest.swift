//
//  CompleteTaskTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class CompleteTask: BaseTest {
    
    // TO DO: переписати щоб брало з сторінки логіну і дефолт велʼю
    let email = "dummy@gmail.com"
    let password = "1"
    
    let taskCompleted = "Selected"
    let taskUnchecked = "Not selected"
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }
    
    func testCompleteTask() throws {
        let loginScreen = LoginScreen()
        // TO DO: або переписати функцію щоб не питало по сто раз
        loginScreen.login(email: email, pass: password)

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.selectedTask.tap()
        
        tasksScreen.checkTaskStatus(status: taskCompleted)
        
        tasksScreen.checkOtherTasksStatuses(status: taskUnchecked)
        
    }
}
