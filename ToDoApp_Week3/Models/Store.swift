//  Store.swift

import Foundation

class Store : Decodable, ObservableObject{
    var toDoItems : [toDoItem]
    
    init(filename: String = "todoitems.json") {
        self.toDoItems = Bundle.main.decode(filename: filename, as: [toDoItem].self)
    }
}
