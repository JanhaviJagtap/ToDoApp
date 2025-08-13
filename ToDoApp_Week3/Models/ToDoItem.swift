//
//  ToDOItem.swift
//  ToDoApp_Week3
//
//  Created by Janhavi Jagtap on 13/8/2025.
//
import Foundation;

struct toDoItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let item: String
}
