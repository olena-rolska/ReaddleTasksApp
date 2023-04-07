//
//  SortTasksByNameTest.swift
//  TasksUITests
//
//  Created by Test on 05.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class SortTasksByNameTest: BaseTest {

    func testSortTasksByName() throws {
        
        let loginScreen = LoginScreen()
        try loginScreen.login()

        let tasksScreen = TasksScreen()
        XCTAssert(tasksScreen.tasksPage.waitForExistence(timeout: 5), "User is not logged in")
        
        tasksScreen.manageAllTasks(option: .sort)
        
        try tasksScreen.checkTasksAreSortedByName()
    }
}
