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
        chooseLogout(option: option)
    }
    
    public func checkTaskStatus(expectedStatus: String, actualStatus: String) throws {
        let options = XCTExpectedFailure.Options()
        
        if expectedStatus == actualStatus {
            options.isEnabled = false
        }
        
        XCTExpectFailure("Expected failure", options: options)
        XCTAssertEqual(expectedStatus, actualStatus)
    }
    
    public func checkOtherTasksStatuses(status: String) {
        for index in 0...tasks.count-1 {
            if index != selectedTaskIndex {
                let anotherTask = tasks.element(boundBy: index)
                let anotherTaskStatus = anotherTask.images["cell_image_view"].value
                if anotherTaskStatus as! String != status {
                    XCTExpectFailure("Tasks statuses are not updated")
                }
            }
        }
    }
    
    public func checkAllTasksStatuses(status: String) throws {
        let options = XCTExpectedFailure.Options()
        options.issueMatcher = { issue in
            issue.type == .assertionFailure && issue.compactDescription.contains("Wrong task status")
        }
        
        for index in 0...tasks.count-1 {
            let task = tasks.element(boundBy: index)
            let taskStatus = task.images["cell_image_view"].value
            
            if taskStatus as! String == status {
                options.isEnabled = false
            }
            
            XCTExpectFailure("Expected exception", options: options)
            XCTAssertEqual(taskStatus as! String, status, "Wrong task status")
        }
    }
    
    public func checkTasksAreSortedByName() throws {
        let options = XCTExpectedFailure.Options()
        options.issueMatcher = { issue in
            issue.type == .assertionFailure && issue.compactDescription.contains("Invalid order of tasks")
        }
        
        for index in 0...tasks.count-2 {
            if tasks.element(boundBy: index+1).staticTexts.firstMatch.label > tasks.element(boundBy: index).staticTexts.firstMatch.label {
                options.isEnabled = false
            }
            else {
                options.isEnabled = true
            }
            
            XCTExpectFailure("Expected failure", options: options)
            XCTAssertGreaterThan(tasks.element(boundBy: index+1).staticTexts.firstMatch.label, tasks.element(boundBy: index).staticTexts.firstMatch.label, "Invalid order of tasks")
            
            }
    }
    
    func taskProgressSaved() throws {
        let updatedStatus = tasks.element(boundBy: 0).images["cell_image_view"].value as! String
        XCTExpectFailure("Task progress is not saved")
        try checkTaskStatus(expectedStatus: updatedStatus, actualStatus: taskCompleted)
        
    }
    
}
