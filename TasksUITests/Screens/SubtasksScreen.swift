//
//  SubtasksScreen.swift
//  TasksUITests
//
//  Created by Olena Rolska on 03.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class SubTasksScreen: BaseScreen {
    
    let moreInfoButton = app.buttons["More Info"]
    
    // not great practice to check by title
    let subtasksPageTitle = app.staticTexts["Sleep"]
    
    let backButton = app.buttons["Tasks"]
    
    // write command with more checks of the screen - back button, etc
}
