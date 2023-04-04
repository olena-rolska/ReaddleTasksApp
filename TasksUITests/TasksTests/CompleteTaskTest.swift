//
//  CompleteTaskTest.swift
//  TasksUITests
//
//  Created by Test on 04.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class CompleteTask: BaseTest {
    let email = "dummy@gmail.com"
    let password = "1"
    
    override func tearDown() {
        deleteApp()
        super.tearDown()
    }
    
    func testCompleteTask() throws {
        let loginScreen = LoginScreen()
        loginScreen.login(email: email, pass: password)

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")

        
        let tasks = XCUIApplication().tables.cells
        let selectedTaskIndex: Int = 0
        let selectedTask = tasks.element(boundBy: selectedTaskIndex)
        selectedTask.tap()
        
        let selectedTaskStatus = selectedTask.images["cell_image_view"].value
        
        XCTAssertEqual(selectedTaskStatus as! String, "Selected")
        
        for index in 0...tasks.count-1 {
            if index != selectedTaskIndex {
                let anotherTask = tasks.element(boundBy: index)
                let anotherTaskStatus = anotherTask.images["cell_image_view"].value
                XCTAssertEqual(anotherTaskStatus as! String, "Not selected")
            }
        }
    }
}
