//
//  BaseScreen.swift
//  TasksUITests
//
//  Created by Test on 03.04.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import XCTest

class BaseScreen {
    static let app = XCUIApplication()
    static let springboard: XCUIApplication = .init(bundleIdentifier: "com.apple.springboard")
    
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
}
