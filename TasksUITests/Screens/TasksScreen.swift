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
    let cancelAllButton = app.buttons["Cancel All"]
    let sortByNameButton = app.buttons["Sort by Name"]
    
    enum ManageTasks {
        case complete
        case uncheck
        case sort
    }
    
    public func manageAllTasks(option:  ManageTasks) {
        switch option {
        case .complete: completeAllButton.tap()
        case .uncheck: cancelAllButton.tap()
        case .sort: sortByNameButton.tap()
        }
    }
    
    public func chooseLogout(option: LogoutOption) {
        switch option {
        case .logout: logout.tap()
        case .cancel: cancel.tap()
        }
    }
    
    public func logout(option: LogoutOption) {
        logoutButton.tap()
        chooseLogout(option: .logout)
    }
    
    public func checkTaskStatus(expectedStatus: Any, actualStatus: String) {
        XCTAssertEqual(expectedStatus as! String, actualStatus)
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
    
    public func checkTasksAreSortedByName() {
        for index in 0...tasks.count-2 {
            XCTAssertGreaterThan(tasks.element(boundBy: index+1).staticTexts.firstMatch.label, tasks.element(boundBy: index).staticTexts.firstMatch.label, "Invalid order of tasks")
        }
    }
    
    func taskProgressSaved() {
        let updatedStatus = tasks.element(boundBy: 0).images["cell_image_view"].value
        checkTaskStatus(expectedStatus: updatedStatus, actualStatus: taskCompleted)
        XCTExpectFailure("Task progress is not saved")
    }
    
}
