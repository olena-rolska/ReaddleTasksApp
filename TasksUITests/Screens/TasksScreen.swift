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
    let logoutButton = app.buttons["Logout"]
    let logout = app.alerts.buttons["Logout"]
    let cancel = app.alerts.buttons["Cancel"]
    
    public func chooseLogout(option: LogoutOption) {
        switch option {
        case .logout: logout.tap()
        case .cancel: cancel.tap()
        }
    }
    
    public func completeTask(task: Int) {
        
    }
    
}
