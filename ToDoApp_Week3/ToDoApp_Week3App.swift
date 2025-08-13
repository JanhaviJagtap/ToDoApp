//
//  ToDoApp_Week3App.swift
//  ToDoApp_Week3
//
//  Created by Janhavi Jagtap on 13/8/2025.
//

import SwiftUI

@main
struct ToDoApp_Week3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(toDoItem: todos[0], store: Store())
        }
    }
}
