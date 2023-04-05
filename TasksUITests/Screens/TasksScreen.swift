//
//  TasksScreen.swift
//  TasksUITests
//
//  Created by Olena Rolska on 03.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

enum LogoutOption {
    case logout
    case cancel
}

class TasksScreen: BaseScreen {
    let tasksPage = app.staticTexts["Tasks"]
    let tasks = app.tables.cells
    let selectedTaskIndex: Int = 0
    lazy var selectedTask = tasks.element(boundBy: selectedTaskIndex)
    lazy var selectedTaskStatus = selectedTask.images["cell_image_view"].value
    
    let logoutButton = app.buttons["Logout"]
    let logout = app.alerts.buttons["Logout"]
    let cancel = app.alerts.buttons["Cancel"]
    
    let taskCompleted = "Selected"
    let taskUnchecked = "Not selected"
    
    let completeAllButton = app.buttons["Complete All"]
    
    public func chooseLogout(option: LogoutOption) {
        switch option {
        case .logout: logout.tap()
        case .cancel: cancel.tap()
        }
    }
    
    public func checkTaskStatus (status: String) {
        XCTAssertEqual(selectedTaskStatus as! String, status)
    }
    
    public func checkOtherTasksStatuses(status: String) {
        for index in 0...tasks.count-1 {
            if index != selectedTaskIndex {
                let anotherTask = tasks.element(boundBy: index)
                let anotherTaskStatus = anotherTask.images["cell_image_view"].value
                XCTAssertEqual(anotherTaskStatus as! String, status)
            }
        }
    }
    
    public func checkAllTasksStatuses(status: String) {
        for index in 0...tasks.count-1 {
           
            let task = tasks.element(boundBy: index)
            let taskStatus = task.images["cell_image_view"].value
            XCTAssertEqual(taskStatus as! String, status)
        }
    }
    
}
