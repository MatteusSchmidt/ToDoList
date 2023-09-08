//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
