//
//  ToDOItem.swift
//  ToDoApp_Week3
//
//  Created by Janhavi Jagtap on 13/8/2025.
//
import Foundation;
import SwiftUICore;

struct toDoItem: Identifiable, Decodable, Encodable {
    let id: UUID = UUID()
    var title: String
    var isDone: Bool
    
}

let todos:[toDoItem]=[
    toDoItem(title: "Buy milk", isDone: false),
    toDoItem(title: "Learn Swift", isDone: false),
    toDoItem(title: "Go for a walk", isDone: false)
]
